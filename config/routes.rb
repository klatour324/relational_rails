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


  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'
end
