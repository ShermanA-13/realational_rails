Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/item_shops', to: 'item_shops#index'
  get '/item_shops/new', to: 'item_shops#new'
  post '/item_shops', to: 'item_shops#create'
  get '/item_shops/:id', to: 'item_shops#show'
  get '/item_shops/:item_shop_id/items', to: 'item_shop_items#index'
  get '/item_shops/:id/edit', to: 'item_shops#edit'
  get 'item_shops/:id/items/new', to: 'items#new'
  post 'item_shops/:id/items', to: 'items#create'
  patch '/item_shops/:id', to: 'item_shops#update'

  get '/items', to: 'items#index'
  get '/items/:id/edit', to: 'items#edit'
  get '/items/:id', to: 'items#show'
  patch '/items/:id', to: 'items#update'
end
