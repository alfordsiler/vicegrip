Rails.application.routes.draw do

  root 'vices#index'

  get 'vices/new' => 'vices#new'

  post 'vices' => 'vices#create'

  get 'vices/:id' => 'vices#show'

  get "login" => "sessions#new"

  post "login" => "sessions#create"
  
  delete "logout" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :vices
end
