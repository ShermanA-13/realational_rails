Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/item_shops', to: 'item_shops#index'
  get '/item_shops/:id', to: 'item_shops#show'
  get '/items', to: 'items#index'
end
