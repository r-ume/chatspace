class MessagesController < ApplicationController
  before_action :authenticate_user!,     only: %i(index create)
  before_action :set_chat_groups,        only: %i(index create)
  before_action :set_chat_group,         only: %i(index create)
  before_action :set_decorated_messages, only: %i(index create)
  # CSRF対策を無効にしたい場合に入れるコード
  skip_before_filter :verify_authenticity_token

  def index
    @chat_groups = current_user.chat_groups
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
        format.html do
          redirect_to chat_group_messages_path(@chat_group)
        end

        format.json do
          render json: { user: @message.user.name, time: @message.created_at, body: @message.body, image: @message.image.url }
        end
      end
      flash[:notice] = 'successfully sent'
    else
      flash[:alert] = 'Unfortunately failed to sent'
      render :index
    end
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

  def set_decorated_messages
    @messages = MessagesDecorator.decorate_collection(@chat_group.messages)
  end
end
