Rails.application.routes.draw do
  resources :users
  namespace :admin do
    resources :documents
    resources :users

    root to: "documents#index"
  end

  namespace :public do
    get 'documents/:id', to: "documents#show", as: :document
    get 'health_checks', to: "health_checks#index"
  end

  resources :documents
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }

  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
