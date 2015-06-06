Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  resources :users, only: [:new, :create]
  resources :students

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :issues
  end
end
