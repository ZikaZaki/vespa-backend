Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:create]
  root to: "static#home"
end
