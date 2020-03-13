Rails.application.routes.draw do
  devise_for :users
	
  resources :tweets 
  root 'tweets#index'
	
  resources :relationships
  root 'relationships#index'

end
