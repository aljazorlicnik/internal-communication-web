Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index]
    end
  end

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'registrations/new'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'home', to: 'home#index'
  root to: 'sessions#new'
  resources :users
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  resources :messages, only: [:show, :new, :create, :each]
  get 'new_message', to: 'messages#new'
  get 'messages', to: 'messages#show'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  # root "posts#index"
end
