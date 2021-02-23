Rails.application.routes.draw do
  get 'rooms/create'
  get 'rooms/show'
  get 'messages/create'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers, :likes
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :microposts do
    get :search, on: :collection
    resources :comments
  end

  resources :relationships,       only: [:create, :destroy]
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  resources :favorite_relationships, only: [:create, :destroy]
end