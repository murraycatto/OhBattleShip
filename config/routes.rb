Rails.application.routes.draw do
  resources :users
  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/game/:id(.:format)', to: 'users#game', as: 'game'
  post '/nuke', to: 'users#nuke', as: 'nuke'
end
