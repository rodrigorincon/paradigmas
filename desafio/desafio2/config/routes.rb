Rails.application.routes.draw do
  resources :tasks

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'anexos/:id', to: 'anexos#get_file'
  patch 'tasks/:id/complete', to: 'tasks#complete'

  resources :sessions, only: [:create, :destroy]

  root to: "tasks#index"
end
