Rails.application.routes.draw do
  devise_for :admins
  get 'admin' => "admin/homes#top", as: "admin_top"

  namespace :admin do
   resources :products, only: [:new, :index, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
  end

 namespace :public do
 get 'home/about' => "homes#about", as: "home_about"
 get 'home/about' => "homes#about", as: "home_about"
 end

 root to: 'public/homes#top'
 get 'home/about' => "homes#about"

end