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

end
