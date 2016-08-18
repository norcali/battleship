Battleship::Application.routes.draw do
  #resources :games
  root to: "games#index", via: :get
  resources :users
end
