Rails.application.routes.draw do
  root 'static_pages#home'

 # get '/campaigns', to: 'campaigns#index'
  resources :campaigns

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
