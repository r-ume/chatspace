Rails.application.routes.draw do
   devise_for :users
   get '/messages' => 'messages#index'
   post '/messages' => 'messages#create'
   get 'chat_groups' => 'chatgroups#index' #チャットグループ一覧
   get 'chat_groups/new' => 'chatgroups#new' 
   post 'chat_groups' => 'chatgroups#create' 
   get 'chat_groups/:chat_group_id/edit' => 'chatgroups#edit' #チャットグループ一覧
   patch 'chat_groups/:chat_group_id' => 'chatgroupd#update'
end