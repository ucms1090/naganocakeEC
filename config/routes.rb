Rails.application.routes.draw do

  root to: 'homes#top'

  scope module: 'public' do
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :orders, only: [:new, :show, :index]
    post 'orders', to: 'orders#confirm', as: 'orders_confirm'
    get 'orders', to: 'orders#complete', as: 'orders_complete'
    delete 'cart_items', to: 'cart_items#destroy_all', as: 'cart_items_destroy_all'
  end


  namespace :admin do
    resources :items
    resources :genres
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
