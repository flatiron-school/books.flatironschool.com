Rails.application.routes.draw do

  root 'books#index'

  get 'tags/create'

  post '/organizations' => 'organizations#create', :as => 'orgs'

  post '/books/users' => 'users#books', :as => 'user_books'

  # admin
  get '/admin' => "admin#index", :as => "admin"
  post '/admin' => "admin#create", :as => "create_admin"
  delete '/admin/:id' => "admin#destroy", :as => "destroy_admin"
  delete '/organization/:id' => "organizations#destroy", :as => "destroy_org"

  # sessions
  get '/login' => "sessions#new", :as => 'login'
  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]
  match "/signout" => "sessions#destroy", :as => :signout, via: [:get, :post]

  # books
  post '/books/sort' => "books#sort", :as => "books_sort"
  post '/books/search' => "books#search", :as => "books_search"
  get '/books/:id/download' => "books#download", :as => "download_book"
  
  resources :books do
    resources :types
  end

  resources :tags
  
  resources :types

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
