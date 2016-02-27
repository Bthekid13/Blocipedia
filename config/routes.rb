Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :wikis

  devise_for :users

end
