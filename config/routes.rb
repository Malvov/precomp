Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { sessions: 'devise_users/sessions', confirmations: 'devise_users/confirmations' }
  
  get '/profile', to: 'users#show', as: :profile

  resources :products do
    member do
      delete :remove_attachment
    end
  end

  resources :product_images, only: :index
  resources :product_imports, only: [:new, :create]

  resources :providers do
    resources :addresses, path: :branch_offices, as: :branch_offices, except: [:destroy, :show]
    resources :contact_provider_mailer, only: [:new, :create]
  end

  resources :advanced_search, only: :index
  
  resources :favorite_products, only: [:index, :destroy, :create]
  
  root to: 'countdown#index'

  get 'index', to: 'static_pages#index'
  get 'about', to: 'static_pages#about'
  # root to: 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
