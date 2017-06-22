Rails.application.routes.draw do
  root 'static_pages#home'

  resources :campaigns do
    resources :scenarios
    resources :investigators
  end

  get '/client/show', to: 'client#show', format: false

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
