class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_chat_groups
  before_action :set_chat_group
  #CSRF対策を無効にしたい場合に入れるコード
  skip_before_filter :verify_authenticity_token

  def index
    @messages = @chat_group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.chat_group = @chat_group
    @message.user = current_user
    @message.save

    # if @message.save
    #   success: 'Successfully send a message'
    # else
    #   warning: 'Unfortunately failed to create'
    # end

    @messages = @chat_group.messages.all
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def set_chat_groups
    @chat_groups = ChatGroup.all
  end
  #
  def set_chat_group
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end
end