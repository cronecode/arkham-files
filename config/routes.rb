Rails.application.routes.draw do
  root 'static_pages#home'

  resources :campaigns do
    resources :scenarios
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
