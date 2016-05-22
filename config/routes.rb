Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 , defaults: { format: :json } do
      # resources :films do #, only: [:show] 
      #   member do
      #     get 'info'
      #   end
      #   collection do
      #     get 'on_screen'
      #   end
      # end
      resources :users, only: [:show, :create,:update]
      resources :sessions, only: [:create]
      resources :like, only: [:create]
      resources :dislike, only: [:create]
      resources :cinemas, only: [:index] do
        # member do
        #   get 'current_films'
        # end
      end
      get 'cinemas/current_films'
      get 'films/on_screen'=>'films#on_screen'
      get 'likes_and_dislikes'=>'films#likes_and_dislikes'
      get 'screen_preference'=>'screen#screen_preference'
      post 'screen_like'=>'screen#like_screen'
      post 'screen_dislike'=>'screen#dislike_screen'
      delete 'users/delete'=>'users#destroy'
      delete 'sessions/delete'=>'sessions#destroy'
      get 'is_user_sign_in'=>'users#is_user_sign_in'
      get 'my_liked_films'=>'films#my_liked_films'
      post 'set_default_cinema'=>'users#set_default_cinema'
    end
  end
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
