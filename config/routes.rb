Rails.application.routes.draw do
   GET '/' => 'chaggroups#index'

   #UsersControllerを作成するときに、deviseをインストールする   
   #get '/users/sign_up'　#サインアップページ
   #get '/users/sign_in' #ログインページ

   GET 'chat_groups' => 'chatgroups#index' #チャットグループ一覧
   GET 'chat_groups/new' => 'chatgroups#new' 
   POST 'chat_groups' => 'chatgroups#create' 
   GET 'chat_groups/:chat_group_id/edit' => 'chatgroups#edit' #チャットグループ一覧
   PATCH 'chat_groups/:chat_group_id' => 'chatgroupd#update'
   GET 'chat_groups/:chat_group_id' => 'messages#index'
   POST 'chat_groups/:chat_group_id' => 'messages#create' 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
