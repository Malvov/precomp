Rails.application.routes.draw do
  resources :providers do
    resources :addresses, path: :branch_offices, as: :branch_offices
  end
  
  root to: 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
