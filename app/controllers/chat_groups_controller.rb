class ChatGroupsController < ApplicationController
  before_action :authenticate_user!, only: %i(index create)
  before_action :set_chat_group, only: %i(edit update)

  # GET/chat_groups
  def index
    @chat_groups = current_user.chat_groups
  end

  # GET /chat_groups/new
  def new
    @new_chat_group = ChatGroup.new
  end

  #POST /chat_groups
  def create
    @chat_group = ChatGroup.new(chat_group_params)
    @chat_group.save
    redirect_to controller: :chat_groups, action: :index
  end

  # GET /chat_groups/:chat_groups_id/edit
  def edit
  end

  def update
    @chat_group.update(chat_group_params)
    redirect_to controller: :chat_groups, action: :index
  end

  private

  def set_chat_group
    @chat_group = ChatGroup.find(params[:id])
  end

  def chat_group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end

end