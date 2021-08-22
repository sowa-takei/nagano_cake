Rails.application.routes.draw do
  devise_for :admins
  root to: 'admin/homes#top'
  resources :products, only: [:new, :index, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
end
