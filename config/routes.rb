Rails.application.routes.draw do
  resources :users, except: [:new]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  root to: 'users#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
