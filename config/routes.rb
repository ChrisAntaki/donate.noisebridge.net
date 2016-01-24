Rails.application.routes.draw do
  root 'donations#index'

  get '/thanks', to: 'donations#thanks'

  resources :projects, only: [:show, :index]

  scope :donations do
    resource :subscriptions, only: [:create]
    resource :charges, only: [:create]
  end
end
