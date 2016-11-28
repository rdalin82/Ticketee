Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'
    # get 'users' => "users#index"
    resources :users, only: [:index, :new, :create, :destroy]
    resources :projects, only: [:new, :create, :destroy ]
  end

  devise_for :users
  root "projects#index" 
  resources :projects, only: [:index, :show, :edit, :update] do 
    resources :tickets 
  end
end
