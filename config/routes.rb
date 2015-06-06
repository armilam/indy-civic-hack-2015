Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  resources :users, only: [:new, :create]
  resources :students

  namespace :admin do
    scope :issues do
      get :search, to: "issues#search", as: :issues_search
    end

    resources :issues
  end
end
