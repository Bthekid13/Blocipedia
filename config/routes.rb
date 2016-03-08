Rails.application.routes.draw do


  root to: 'welcome#index'

  devise_for :users

  resources :topics

  resources :wikis

  resources :charges, only: [:new, :create, :destroy]

  resources :users, only: [] do
    member do
      post :downgrade
    end
  end

end
