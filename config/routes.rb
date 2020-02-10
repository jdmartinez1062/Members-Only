Rails.application.routes.draw do
  get 'sessions/new'
  root 'statics#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :statics, only: [:new]
  resources :posts,  except: [:destroy]
  resources :users,  except: [:destroy, :index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
