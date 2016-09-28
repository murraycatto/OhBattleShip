Rails.application.routes.draw do
  get '/games/(.:format)', to: 'games#index', as: 'games'
  get '/game/new(.:format)', to: 'games#new', as: 'new_game'
  get '/game/:id(.:format)', to: 'games#game', as: 'game'
  get '/game_status/', to: 'games#game_status', as: 'game_status'
  get '/ships_sunk/', to: 'games#ships_sunk', as: 'ships_sunk'

  post '/nuke', to: 'nukes#nuke', as: 'nuke'
  post '/game/new(.:format)', to: 'games#create', as: 'create_game'
  root 'games#new'
end
