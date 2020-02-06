Rails.application.routes.draw do


  devise_for :admins
  devise_for :customers

  root 'customers#top'

  get 'orders/:id/confirm', to: 'orders#confirm'
  get 'orders/complete', to: 'orders#complete'
  get 'about', to: 'customers#about'
  get 'customers/cancel_registrations', to: 'customers#cancel_registrations'

  resources :customers, :deliveries, :orders, :cart_items, :items


  namespace :admins do
    resources :customers, :orders, :items, :genres
    get 'top', to: 'items#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
