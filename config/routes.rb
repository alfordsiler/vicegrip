Rails.application.routes.draw do

  root 'home#index'
 
  post 'setbacks' => 'setbacks#create'

  get ':vice_id/setbacks/new' => 'setbacks#new', as: 'newsetback'

  get ':vice_id/setbacks/:id' => 'setbacks#show'

  #get 'setbacks/:id/delete' => 'setbacks#destroy', as: 'delete_setback'

  get 'vices' => 'vices#index'

  get 'vices/new' => 'vices#new'

  post 'vices' => 'vices#create'

  get 'vices/:id' => 'vices#show'

  get 'profile' => 'user#index'

  get 'signup' => 'user#new'

  post 'signup' => 'user#create'

  get "login" => "sessions#new"

  post "login" => "sessions#create"
  
  delete "logout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :setbacks
  resources :vices
  resources :user
end