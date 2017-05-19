Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end
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
      get :checkout
    end
  end
  resources :products do
    member do
      post :add_to_cart
    end
  end
  namespace :admin do
    resources :products
    resources :orders
  end
  namespace :account do
    resources :orders
  end
  root 'welcome#index'
end
