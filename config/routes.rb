Rails.application.routes.draw do


  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  get 'orders/:id/confirm', to: 'orders#confirm', as: 'orders_confirm'
  get 'orders/complete', to: 'orders#complete'
  resources :customers, :deliveries, :orders, :cart_items, :items

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  root 'customers#top'

  get 'about', to: 'customers#about'
  get 'customers/cancel_registrations', to: 'customers#cancel_registrations'

  namespace :admins do
    resources :customers, :orders, :items, :genres
    get 'top', to: 'items#top'
  end
end