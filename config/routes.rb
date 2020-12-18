Rails.application.routes.draw do
  resources :trips, only: [:new, :create, :edit, :update, :show]
  resources :trails, only: [:index, :show]
  resources :hikers
  get '/hiker-app', to: 'home#show'
end
