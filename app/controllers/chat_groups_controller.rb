class ChatGroupsController < ApplicationController

  # GET/chat_groups
  def index
    @chat_groups = ChatGroup.all
  end

  # GET /chat_groups/new
  def new
    @new_chat_group = ChatGroup.new
    # @new_chat_group.users << current_user
  end

  #POST /chat_groups
  def create
    @chat_group = ChatGroup.new(chat_group_params)
    @chat_group.save
    redirect_to controller: :chat_groups, action: :index
  end

  def update

  end

  # GET /chat_groups/:chat_groups_id/edit
  def edit
    @existing_chat_group = ChatGroupUser.user
  end

  def delete

  end

  private

  def set_chat_group
    @chat_group = ChatGroup.find(params[:id])
  end

  def chat_group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end

end
