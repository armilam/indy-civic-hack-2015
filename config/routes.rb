Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  resources :users, only: [:new, :create]
  resources :students

  namespace :admin do
    resources :issues
  end
end
