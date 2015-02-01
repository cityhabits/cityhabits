Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  get 'home/video'

  resources :events, only: [:index]

  resources :albums, only: [:index, :show] do
    resources :event_photos, only: [:index, :new, :create]
  end


  root to: 'visitors#index'
  # devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:show]

  resources :profile, only: [:index]



  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  authenticated :admin do
    root to: 'rails_admin/main#dashboard', as: :admin_root
  end
end
