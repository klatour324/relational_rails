Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new'
  post '/locations', to: 'locations#create'
  get '/locations/:id', to: 'locations#show'
  get '/locations/:id/edit', to: 'locations#edit'
  patch '/locations/:id', to: 'locations#update'
  delete '/locations/:id', to: 'locations#destroy'

  get '/bookstores', to: 'bookstores#index'
  get '/bookstores/new', to: 'bookstores#new'
  post 'bookstores', to: 'bookstores#create'
  get '/bookstores/:id', to: 'bookstores#show'
  get '/bookstores/:id/edit', to: 'bookstores#edit'
  patch '/bookstores/:id', to: 'bookstores#update'
  delete '/bookstores/:id', to: 'bookstores#destroy'

  get '/locations/:location_id/bookstores', to: 'locations#bookstores'

  get '/libraries/:library_id/books', to: 'library_books#index'
  get '/libraries/:library_id/books/new', to: 'library_books#new'
  post '/libraries/:library_id/books', to: 'library_books#create'


  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#destroy'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
