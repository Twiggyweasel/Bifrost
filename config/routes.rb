Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    get '/admin', to: redirect('/admin/dashboard')
    
    namespace :admin do
      get 'dashboard', to: 'pages#dashboard'
      resources :clients
      resources :tickets
      resources :users
    end
  
    resources :clients, only: [:show]
  
end
