Rails.application.routes.draw do

  root 'chat_groups#index'

   devise_for :users

  resources :chat_groups, only: [:index, :new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
   # get 'chat_groups/:chat_group_id/messages' => 'messages#index'
   # post 'chat_groups/:chat_group_id/messages' => 'messages#create'
   # get 'chat_groups' => 'chat_groups#index' #チャットグループ一覧
   # get 'chat_groups/new' => 'chat_groups#new'
   # post 'chat_groups' => 'chat_groups#create'
   # get 'chat_groups/:chat_group_id/edit' => 'chat_groups#edit' #チャットグループ一覧
   # patch 'chat_groups/:chat_group_id' => 'chat_groups#update'
end