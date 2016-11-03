class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @messages = Message.all
    @message = Message.new

    # @message_with_chatgroup_id = Message.where(:)
  end

  def create
    @message = Message.create(message_params)
    @messages = Message.all
  end

  private def message_params
    params.require(:message).permit(:body)
  end
end