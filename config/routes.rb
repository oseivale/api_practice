Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :plays
  resources :entries

  root 'plays#index'


  post 'plays/image', to: "plays#image_saved"


end
