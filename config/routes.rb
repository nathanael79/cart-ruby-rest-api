Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :cart_details
      resources :carts
      resources :product_variant_details
      resources :product_variants
      resources :products
      resources :categories
      resources :variant_types
      resources :stores
      resources :users
      post "/register", to: "auth#create"
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
