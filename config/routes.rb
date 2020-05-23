Rails.application.routes.draw do
  get 'welcome/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions do
    resources :rides, only: [:create]
  end

  get '/signin', to: 'sessions#new', as: :signin
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  root 'welcome#home'
end
