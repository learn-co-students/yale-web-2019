Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get('/authors', {to:'authors#index', as: 'authors'})
  # get '/authors/:id', to: 'authors#show'

  # resources :authors, only: [:index, :show]

end
