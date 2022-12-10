Rails.application.routes.draw do

  root to: 'homes#top'
  get 'about' => 'homes#about'

  namespace :admin do
    resources :items
    resources :genres
  end


  scope module: 'public' do
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    post 'orders/confirm', to: 'orders#confirm', as: 'orders_confirm'
    get 'orders/complete', to: 'orders#complete', as: 'orders_complete'
    resources :orders, only: [:new, :show, :index, :create]
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all', as: 'cart_items_destroy_all'
    get 'customers/mypage', to: 'customers#show', as: 'mypage'
    get 'customers/information/edit', to: 'customers#edit', as: 'edit_information'
    patch 'customers/information', to: 'customers#update', as: 'information'
    get 'customers/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw', to: 'customers#withdraw', as: 'withdraw'
  end


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
