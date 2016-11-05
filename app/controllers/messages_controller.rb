class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_chat_groups
  before_action :set_chat_group

  def index
    @messages = @chat_group.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.chat_group = @chat_group
    @message.save

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