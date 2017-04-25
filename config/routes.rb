Rails.application.routes.draw do

  get '', to: 'statics#landing', as: 'landing'

  devise_for :users

  namespace :admin do
    resources :users do
      collection do
        resources :vacations, only: [:index, :show, :destroy, :update]
        get 'request/:id', to: 'vacations#request_show', as: 'request'
        get 'requests', to: 'vacations#requests', as: 'requests'
        get 'show_vacations', to: 'vacations#show_vacation', as: 'show_vacations'
      end
      resources :vacations, only: [:new, :create]
      get 'show_vacations', to: 'users#show_vacation', as: 'show_vacations'
    end
    resources :invitations, only: [:index, :new, :create, :destroy]
    namespace :wiki do
      resources :categories, only: [:edit, :create, :update, :new, :destroy] do
        resources :posts, only: [:new, :create, :edit, :update, :destroy]
      end
    end
  end

  resources :users, only: [:index, :show] do
    collection do
      resources :notifications, only: [:index, :destroy]
    end
  end

  namespace :wiki do
    resources :categories, only: [:index]
    resources :posts, only: [:show]
  end

  resources :vacations, only: [:show, :new, :create, :destroy]
  get 'requests', to: 'vacations#requests', as: 'requests'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
