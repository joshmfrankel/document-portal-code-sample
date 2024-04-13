Rails.application.routes.draw do
  namespace :admin do
    resources :documents
    resources :users

    root to: "documents#index"
  end

  namespace :public do
    get 'documents/:id', to: "documents#show", as: :document
  end

  resources :documents
  devise_for :users

  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
