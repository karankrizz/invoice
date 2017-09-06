Rails.application.routes.draw do
  resources :invoices
  devise_for :users
  resources :users, except: [:show, :edit, :update, :destroy, :index]

  root to: 'invoices#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
