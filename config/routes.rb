Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: 'devise_users/sessions', confirmations: 'devise_users/confirmations' }
  
  get '/profile', to: 'users#show', as: :profile

  resources :products
  resources :providers do
    resources :addresses, path: :branch_offices, as: :branch_offices, except: [:index, :destroy, :show]
  end
  
  root to: 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
