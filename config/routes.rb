Rails.application.routes.draw do
 root to: "static#home"
 resources :sessions, only: [:create, :destroy]
 get :logged_in, to: "sessions#logged_in"
 resources :registration, only: [:create]
end
