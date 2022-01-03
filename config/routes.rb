Rails.application.routes.draw do
  constraints subdomain: 'admin' do
    devise_for :admins, controllers: { sessions: 'admins/sessions' }

    # admin_general_routes
    root to: 'admin#dashboard', as: 'admin/dashboard'

    #admin products routes
    resources :products , controller: 'admin/products'
    get 'load-products', to: 'admin/products#load_index', as: 'load-products'

    #admin taxes routes
    resources :taxes , controller: 'admin/taxes'
    get 'load-taxes', to: 'admin/taxes#load_index', as: 'load-taxes'
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'website#home'
end
