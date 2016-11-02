class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    Message.create(message_params)
    @messages = Message.all
  end

  private def message_params
    params.require(:message).permit(:body)
  end
end


