Rails.application.routes.draw do

  root to: "students#index"
  devise_for :users
  resources :users, only: [:new, :create]

end
