Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/create'
  get 'comments/new'
  get 'comments/edit'
  get 'comments/show'
  get 'comments/update'
  get 'comments/destroy'
  get 'keijibans/show'
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
      get :following, :followers
    end
  end
  resources :users
  resources :comments
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts
  resources :relationships,       only: [:create, :destroy]
end