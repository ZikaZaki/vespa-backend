Rails.application.routes.draw do
  resources :cities
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  get 'latest', to: 'cities#latest'
  root to: "static#home"
end
