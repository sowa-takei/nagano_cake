Rails.application.routes.draw do
   root to: 'public/homes#top'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  get 'admin' => "admin/homes#top", as: "admin"

  namespace :admin do
   resources :products, only: [:new, :index, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :customers, only: [:index, :show, :edit, :update]
  end

 scope module: :public do
  get 'homes/about' => "homes#about"
  post 'orders/verification' => "orders#verification"
  get 'orders/verification' => "orders#verification"
  get 'orders/completion' => "orders#completion"
  get 'customers/withdrawal' => "customers#withdrawal"
  get 'customers/process' => "customers#process"
  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :index, :show, :create]
  resource :customers, only: [:show, :edit, :update]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    member do
      delete :delete
    end
  end

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

 end




end