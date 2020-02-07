Rails.application.routes.draw do
  root 'statics#new'
  resources :statics, only: [:new]
  resources :posts,  except: [:destroy]
  resources :users,  except: [:destroy, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
