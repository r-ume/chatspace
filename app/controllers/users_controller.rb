class UsersController < ApplicationController
  def index
    # http://www.rokurofire.info/2014/01/05/rails_jquery_incsearch/
    # 上のページ参照
    # jQueryのdataで、１つのカラムだけを絞って、それを検索するようにする。
    # 今まで、@users = User.allと書いていたが、オブジェクトがjsonに返されるため、うまくいかなかった。
    #　現状は、emailでやっていく。（次にnameに直す。）
    @users = User.where('name LIKE ?', "%#{params[:name]}%")
    respond_to do |format|
      format.json { render json: @users }
    end
  end
end

