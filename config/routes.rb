Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get '/dashboard', to: 'users#show'
  get '/newuser', to: 'users#new'
  post '/newuser', to: 'users#create'

  get '/login', to: 'sessions#new', as: 'login' 
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout' 

  # resources :users, only: [:new, :create]

end
