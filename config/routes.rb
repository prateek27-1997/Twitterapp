Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
	
  resources :tweets 
  root 'tweets#index'
	
  resources :relationships, only: [:create, :destroy]

end
