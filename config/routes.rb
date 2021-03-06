Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users
  resources :users, only: [:new, :create]
  resources :students, only: [:index, :show, :new, :create] do
    resources :applications, only: [:new, :create, :show]
  end

  namespace :admin do
    scope :issues do
      get :search, to: "issues#search", as: :issues_search
    end

    resources :students

    resources :issues

    scope :applications do
      get :search, to: "applications#search", as: :applications_search
    end

    resources :applications
  end
end
