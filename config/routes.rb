Rails.application.routes.draw do
  get 'pages/home'
  get 'users/show'

  get 'dashboard/user', to: 'dashboard#user', as: :user_dashboard

  devise_for :users, controllers: { registrations: 'registrations' } 

  root "pages#home"

  get "/claim", to: "pages#claim"


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
