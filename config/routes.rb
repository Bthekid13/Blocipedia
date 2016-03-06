Rails.application.routes.draw do


  root to: 'welcome#index'

  devise_for :users

  resources :topics

  resources :wikis

  resources :charges, only: [:new, :create, :destroy]

  get 'downgrade' => 'users#downgrade'

  get 'keep' => 'users#keep'


end
