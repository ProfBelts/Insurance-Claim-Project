Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: 'admins/registrations' }
  get 'pages/home'
  get "/claim", to: "pages#claim"
  get "/user_list", to: "pages#user_list"
  get "/manage_claim", to: "pages#manage_claim"
  get "/transactions", to: "pages#transactions"

  get 'users/show', to: 'users#show', as: :user_profile

  get 'dashboard/user', to: 'dashboard#user', as: :user_dashboard
  get 'dashboard/admin', to: 'dashboard#admin', as: :admin_dashboard

  devise_for :users, controllers: { registrations: 'users/registrations' } 

  root "pages#home"

  resources :users, only: [:show]
  resources :claims, only: [:create]
  
  patch "/claims/:id/approve", to: "claims#approve", as: :approve_claim
  patch "/claims/:id/reject", to: "claims#reject", as: :reject_claim

  get "/policies/by_type", to: "policies#by_type"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
