Rails.application.routes.draw do
  root to: 'genres#index'
  resources :genres, only: [:index, :new]

end
