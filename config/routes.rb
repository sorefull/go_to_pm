Rails.application.routes.draw do
  get '', to: 'statics#landing', as: 'landing'

  devise_for :users

  resources :users do
    collection do
      resources :vacations, only: [:index, :show, :destroy]
      get 'show_vacations', to: 'vacations#show_vacation', as: 'show_vacations' 
    end
    resources :vacations, only: [:new, :create]
    get 'show_vacations', to: 'users#show_vacation', as: 'show_vacations'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
