Rails.application.routes.draw do


  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  root 'customers#top'

  get "orders/confirm", to: "orders#confirm", as: "confirm"
  get 'orders/complete', to: 'orders#complete'
  get 'customers/cancel_registrations', to: 'customers#cancel_registrations',as: 'cancel_registration'
  get 'about', to: 'customers#about'

  resources :customers, :deliveries, :orders,  :items
  resources :cart_items
  delete 'cart_items_destroy_all' => 'cart_items#destroy_all',as: 'cart_items_destroy_all'

  namespace :admins do
    resources :customers, :orders, :items, :genres, :order_items
    get 'top', to: 'items#top'
  end
end