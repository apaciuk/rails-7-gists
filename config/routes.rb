Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'gists#index'
  get '/gists' => 'gists#index', as: 'all_gists'
  get '/gists/:id' => 'gists#show', as: 'gist'

  get '/user/:name/gists' => 'users#show', as: 'user'
end
