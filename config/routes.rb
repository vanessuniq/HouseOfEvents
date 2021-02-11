Rails.application.routes.draw do
 root to: "static#home"
 namespace :api do
  resources :sessions, only: [:create, :destroy]
  get :auto_login, to: "sessions#auto_login"
  resources :registration, only: [:create]
  resources :events, only: %i[index show create update destroy]
  
 end
 
end
