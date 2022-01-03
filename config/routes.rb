Rails.application.routes.draw do
  constraints subdomain: 'admin' do
    devise_for :admins, controllers: { sessions: 'admins/sessions' }

    # admin_general_routes
    root to: 'admin#dashboard', as: 'admin/dashboard'

    #admin products routes
    resources :products, controller: 'admin/products' do
      resources :product_options, except: %i[index show], controller: 'admin/product_options'
    end
    get 'load-products', to: 'admin/products#load_index', as: 'load-products'
    get 'edit-product-tax', to: 'admin/products#edit_product_tax', as: 'edit-product-tax'
    patch 'update-product-tax', to: 'admin/products#update_product_tax', as: 'update-product-tax'
    # post 'create-product-option', to: 'admin/products#create_product_option', as: 'create-product-option'
    # patch 'edit-product-option', to: 'admin/products#edit_product_option', as: 'edit-product-option'
    # delete 'destroy-product-option', to: 'admin/products#destroy_product_option', as: 'destroy-product-option'

    #admin taxes routes
    resources :taxes, controller: 'admin/taxes'
    get 'load-taxes', to: 'admin/taxes#load_index', as: 'load-taxes'
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'website#home'
end
