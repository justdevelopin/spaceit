Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "pages#home"

  resources :spaces do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

  # Add this line for a non-nested route to handle the index action
  resources :bookings, only: [:index]


  # Other routes...
end
