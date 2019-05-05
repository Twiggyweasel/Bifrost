Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    namespace :admin do
      get 'dashboard', to: 'pages#dashboard'
      resources :clients
    end
  
    resources :clients, only: [:show]
  
end
