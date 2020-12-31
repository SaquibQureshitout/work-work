Rails.application.routes.draw do

 root 'sessions#new'

 resources :sessions do
 	member do
 		get 'getin'
 		delete 'logout'
 		post 'login'
 	end 
 end 
 #get 'signup', to: 'users#new' , as: 'signup'
  post 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :employees do 
  	member do
  		post 'deactivate'
  		post 'activate'
  	end 
  end
end 
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

