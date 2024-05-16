Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :update]
      resources :session, only: [:create]
    end
  end

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'registrations/new'
  get 'home/index'
  get 'users', to: 'users#index'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  

  get 'home', to: 'home#index'
  root to: 'sessions#new'
  resources :users
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  resources :messages, only: [:show, :new, :create, :edit, :update, :destroy]
  delete 'messages/:id', to: 'messages#destroy'
  get 'new_message', to: 'messages#new'
  get 'each/:id', to: 'pages#each', as: 'each'
  get 'messages', to: 'messages#show'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
end
