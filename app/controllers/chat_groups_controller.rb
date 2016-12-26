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
    if @chat_group.save
      flash[:notice] = 'グループ作成成功'
      redirect_to controller: :chat_groups, action: :index
    else
      flash[:alert] = 'グループ作成失敗'
      redirect_to new_chat_group_path
    end
  end

  # GET /chat_groups/:chat_groups_id/edit
  def edit
    @chat_group_users = @chat_group.users
  end

  def update
    if @chat_group.update(chat_group_params)
      flash[:notice] = 'グループ編集成功'
      redirect_to chat_group_messages_path(@chat_group)
    else
      flash[:alert] = 'グループ作成失敗'
      redirect_to edit_chat_group_path(@chat_group)
    end


  end

  private

  def set_chat_group
    @chat_group = ChatGroup.find(params[:id])
  end

  def chat_group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end

end