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

  get 'orders/confirm', to: 'orders#confirm', as: 'orders_confirm'
  get 'orders/complete', to: 'orders#complete'
  resources :customers, :deliveries, :orders,  :items
  resources :cart_items
  delete 'cart_items_destroy_all' => 'cart_items#destroy_all',as: 'cart_items_destroy_all'

  root 'customers#top'

  get 'about', to: 'customers#about'
  get 'customers/cancel_registrations', to: 'customers#cancel_registrations'

  namespace :admins do
    resources :customers, :orders, :items, :genres
    get 'top', to: 'items#top'
  end
end