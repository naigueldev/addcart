Rails.application.routes.draw do
  resources :cartships
  resources :carts do
    member do
      get :update_cart
    end
  end
  resources :products do
    member do
      get :checkout
      patch :buy
    end
    member do
      get :add_to_cart
    end
  end


  post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'
  root :to => "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
