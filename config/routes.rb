Rails.application.routes.draw do
 root to: "static#home"
 namespace :api do
  resources :sessions, only: [:create, :destroy]
  get :auto_login, to: "sessions#auto_login"
  resources :registration, only: [:create]
 end
 
end
