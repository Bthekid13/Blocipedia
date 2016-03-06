Rails.application.routes.draw do


  get 'topics/index'

  get 'topics/show'

  get 'topics/create'

  get 'topics/edit'

  get 'topics/update'

  get 'topics/destroy'

  root to: 'welcome#index'

  resources :wikis

  resources :charges, only: [:new, :create, :destroy]

  devise_for :users

end
