Rails.application.routes.draw do
  root 'products#index'
  #get '/products/:category' ,to: 'products#index' , as: 'products_categories'
  get 'products',to: 'products#index' , as: 'products'
  get 'products/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
