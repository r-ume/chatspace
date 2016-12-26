Rails.application.routes.draw do
  root 'chat_groups#index'
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  resources :chat_groups, only: [:index, :new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
end