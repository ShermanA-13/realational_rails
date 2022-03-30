Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/item_shops', to: 'item_shops#index'
  get '/item_shops/new', to: 'item_shops#new'
  get '/item_shops/:id', to: 'item_shops#show'
  get '/item_shops/:item_shop_id/items', to: 'item_shop_items#index'
  post '/item_shops', to: 'item_shops#create'
  get '/item_shops/:id/edit', to: 'item_shops#edit'
  patch '/item_shops/:id', to: 'item_shops#update'

  get '/items', to: 'items#index'
  get '/items/new', to: 'items#new'
  get '/items/:id', to: 'items#show'
end
