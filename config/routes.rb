Rails.application.routes.draw do

  root 'mains#index'
  resources :orders, only: :create

end
