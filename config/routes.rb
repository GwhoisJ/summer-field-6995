Rails.application.routes.draw do
  resources :studios, only: [:index]
  resources :movies, only: [:show]
  resources :actor_movies, only: [:create]
end
