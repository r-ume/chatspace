class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_chat_groups
  before_action :set_chat_group
  #CSRF対策を無効にしたい場合に入れるコード
  skip_before_filter :verify_authenticity_token

  def index
    @messages = @chat_group.messages
    @message = Message.new

    respond_to do |format|
      format.html { render :index }
      # mapメソッドで、userの名前を取得
      format.json { render json: @chat_group.messages.includes(:user).map{|x| x.json_api} }
    end
  end

  def create
    @message = Message.new(message_params)
    @message.chat_group = @chat_group
    @message.user = current_user

    if @message.save
      respond_to do |format|
        format.html { redirect_to :index }
        format.json { render json: { name: @message.user.name, time: @message.created_at, body: @message.body, image: @message.image.url } }
      end
      flash.now[:notice] = 'successfully sent'
    else
      flash.now[:notice] = 'Unfortunately failed to sent'
    end

    @messages = @chat_group.messages.all
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_chat_groups
    @chat_groups = ChatGroup.all
  end

  def set_chat_group
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end
end