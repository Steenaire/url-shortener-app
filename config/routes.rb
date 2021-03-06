Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/', to: 'links#index'
  get '/links/', to: 'links#index'
  get '/links/new', to: 'links#new'
  post '/links', to: 'links#create'
  get '/links/:id', to: 'links#show', as: 'link'
  delete '/links/:id', to: 'links#destroy'
  get '/links/:id/edit', to: 'links#edit', as: 'edit_link'
  patch '/links/:id', to: 'links#update'

  get '/:slug', to: 'visits#create'
end
