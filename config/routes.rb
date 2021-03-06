Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:index, :new, :create]
    post 'upvote' => 'posts#upvote'
    post 'downvote' => 'posts#downvote'
  end

  # resources :comments, only: [:index, :new, :create] do
  #   post 'upvote' => 'posts#upvote'
  #   post 'downvote' => 'posts#downvote'
  # end

  #create user profile page
  get 'profile' => 'users#show'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post '/' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

#           Prefix Verb URI Pattern                            Controller#Action
#             root GET  /                                      posts#index
#    post_comments GET  /posts/:post_id/comments(.:format)     comments#index
#                  POST /posts/:post_id/comments(.:format)     comments#create
# new_post_comment GET  /posts/:post_id/comments/new(.:format) comments#new
#      post_upvote POST /posts/:post_id/upvote(.:format)       posts#upvote
#    post_downvote POST /posts/:post_id/downvote(.:format)     posts#downvote
#            posts POST /posts(.:format)                       posts#create
#         new_post GET  /posts/new(.:format)                   posts#new
#             post GET  /posts/:id(.:format)                   posts#show
#          profile GET  /profile(.:format)                     users#show
#           signup GET  /signup(.:format)                      users#new
#                  POST /signup(.:format)                      users#create
#            login GET  /login(.:format)                       sessions#new
#                  POST /login(.:format)                       sessions#create
#           logout GET  /logout(.:format)                      sessions#destroy

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
