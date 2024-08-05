Rails.application.routes.draw do
  get "statics/index"
  devise_for :users, controller: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Admin namespace
  namespace :admin do
    root "dashboard#index" #admindashboard
  end
  
  namespace :client do
    root "dashboard#index"
  end
  
  authenticated :user, -> user {user.admin?} do
    root to: 'admin/dashboard#index', as: :admin_root_path
  end
  
  authenticated :user do
    root to: 'client/dashboard#index', as: :client_root_path
  end

  # Define the fallback root path for unautenticated
  unauthenticated do
    root to:'home#index'
  end

  resources :profils
  resources :albums
  resources :songs, param: :id
  resources :artists


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "about" => "statics#about"
  get "contact" => "statics#contact"
end