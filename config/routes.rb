Rails.application.routes.draw do
  get '/games/(.:format)', to: 'users#index', as: 'users'
  root 'users#new'
  post '/games(.:format)', to: 'users#create'
  get '/game/new(.:format)', to: 'users#new', as: 'new_user'
  get '/game/:id(.:format)', to: 'users#game', as: 'game'
  get '/game_status/', to: 'users#game_status', as: 'game_status'
  get '/ships_sunk/', to: 'users#ships_sunk', as: 'ships_sunk'
  post '/nuke', to: 'users#nuke', as: 'nuke'
end
