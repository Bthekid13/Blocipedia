Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :wikis

  # get "wikis/index"
  #
  # get "wikis/show"
  #
  # get "wikis/new"
  #
  # get "wikis/edit"

  devise_for :users

end
