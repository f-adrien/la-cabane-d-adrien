Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  constraints subdomain: 'admin' do
    devise_for :admins, controllers: { sessions: 'admins/sessions' }

    # admin_general_routes
    root to: 'admin#dashboard', as: 'admin/dashboard'
end
