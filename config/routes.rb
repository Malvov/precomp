Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: 'users/sessions', confirmations: 'users/confirmations' }
  
  resources :products
  resources :providers do
    resources :addresses, path: :branch_offices, as: :branch_offices, except: [:index, :destroy, :show]
  end
  
  root to: 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
