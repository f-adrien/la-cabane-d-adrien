Rails.application.routes.draw do
  constraints subdomain: 'admin' do
    devise_for :admins, controllers: { sessions: 'admins/sessions' }

    # admin_general_routes
    root to: 'admin#dashboard', as: 'admin/dashboard'

    #admin products routes
    resources :products, controller: 'admin/products' do
      resources :product_options, except: %i[index show], controller: 'admin/product_options'
      resources :product_variants, except: %i[index show], controller: 'admin/product_variants'
    end
    get 'load-products', to: 'admin/products#load_index', as: 'load-products'
    get 'edit-product-tax', to: 'admin/products#edit_product_tax', as: 'edit-product-tax'
    patch 'update-product-tax', to: 'admin/products#update_product_tax', as: 'update-product-tax'

    #admin taxes routes
    resources :taxes, controller: 'admin/taxes'
    get 'load-taxes', to: 'admin/taxes#load_index', as: 'load-taxes'
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'website#home'
end
