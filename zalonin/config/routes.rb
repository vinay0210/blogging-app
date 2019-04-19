
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'carts/status'
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  resources :products
  resources :comments
  resources :posts,only:[:create,:edit,:update,:destroy]
  get 'home/blog'
  get 'home/ecommerce'
  get 'home/productpage'
  root 'home#zalonin'
  get 'home/zalonin'
  post '/likeToggle' => 'likeps#likeToggle'
  get'cart/status'
  post'home/create'=>"home#create"
  post '/likeToggleComment' => 'likecs#likeToggleComment'
  get 'home/profilepage' => 'home#profilepage'
  get'/upload'=> 'home#profile_picture'
  get'home/users' => 'home#users'
  post '/follow' => 'home#follow'
  get '/notifications' => 'notifications#index'
  

  devise_for :users
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
