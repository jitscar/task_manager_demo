Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'tasks#index'

  resources :users
  resources :tasks do
    member do
      put :start
      put :finish
    end
  end
end
