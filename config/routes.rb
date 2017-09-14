Rails.application.routes.draw do
 
  get 'welcome/index'
  root 'welcome#index'
  get '/about' => 'welcome#about'
  get '/dashboard' => 'dashboard#static'
  resources :sessions , only: [:create]
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  resources :users , only: [:index ,:new, :create]
  # similar to :
  #get 'users/new', to: 'users#new'
  #get 'users' , to: 'users#create'

  
   


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
