Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'

  resources :tasks, only: [:index]
  
  root to: 'home#index'
end
