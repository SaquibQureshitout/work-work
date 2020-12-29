Rails.application.routes.draw do

  root 'employees#index'
  resources :employees do 
  	member do
  		post 'deactivate'
  		post 'activate'
  	end 
  end 
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
