Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :rails_pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :rails_pwa_service_worker

  # Defines the root path route ("/")
  root "games#index"
  
  # Game management routes
  get "games/new", to: "games#new", as: :new_game
  post "games", to: "games#create"
  get "games", to: "games#index"
  
  # Game token-based routes (must come after other routes to avoid conflicts)
  get 'game/:token', to: 'games#show', as: :game
  post 'game/:token/vote', to: 'games#vote', as: :vote_game
  get 'game/:token/results', to: 'games#results', as: :results_game
end
