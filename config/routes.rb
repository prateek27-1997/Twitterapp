Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 #get 'tweets' => 'tweets#index'
 #get 'tweets/new' => 'tweets#new'
 #post 'tweets' => 'tweets#create'
 #get 'tweets/:id' => 'tweets#show'
 resources :tweets

 root 'tweets#index'
 root 'tweets#new'
 root 'tweets#create'
 root 'tweets#show'
 root 'tweets#edit'
 root 'tweets#update'
end
