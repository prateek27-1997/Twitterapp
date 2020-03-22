Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'} 
   
   resources :users 
   root 'users#index'
    
  resources :tweets 
  root 'tweets#index'
	
  resources :relationships, :only => [:create, :destroy]

 end
