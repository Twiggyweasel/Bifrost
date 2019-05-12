Rails.application.routes.draw do
  namespace :admin do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    get '/admin', to: redirect('/admin/dashboard')
    
    namespace :admin do
      get 'dashboard', to: 'pages#dashboard'
      resources :clients
      resources :tickets do
        resources :comments, only: [:new, :create, :edit, :update]
      end
      resources :users
      resources :comments, only: [:destroy]
    end
  
    resources :clients, only: [:show]
  
end
