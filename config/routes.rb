Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :pins, only: [:index]
  end 

  resources :pins, only: [:create, :update, :destroy] 

  resources :countries, only: [:index]
  # resources :users_countries do 
  #   collection do 
  #     post :create_or_destroy 
  #   end 
  resources :users_countries, only: [:create]
  
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
end
