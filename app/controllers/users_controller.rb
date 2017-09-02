class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
    # http://www.rokurofire.info/2014/01/05/rails_jquery_incsearch/
    # jQueryのdataで、１つのカラムだけを絞って、それを検索するようにする。
    #　現状は、emailでやっていく。（次にnameに直す。）
    name = params[:name]
    @users = name.present? ? User.by_name(name) : User.all

    render json: @users, each_serializer: UserSerializer
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update_with_password(user_params)
        sign_in(@user, bypass: true)
        format.html { redirect_to root_path }
      end
        format.html { render :edit }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

