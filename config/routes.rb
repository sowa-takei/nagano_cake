Rails.application.routes.draw do
   root to: 'public/homes#top'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  get 'admin' => "admin/homes#top", as: "admin_top"

  namespace :admin do
   resources :products, only: [:new, :index, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
  end

 scope module: :public do
  get 'homes/about' => "homes#about"
  resources :items, only: [:index, :show]
 end




end