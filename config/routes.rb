Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cart_items do
    member do
      delete :destroy
      post :increase
      post :decrease
    end
  end
  resources :carts do
    collection do
      get :clear
    end
  end
  resources :products do
    member do
      post :add_to_cart
    end
  end
  namespace :admin do
    resources :products
  end
  root 'welcome#index'
end
