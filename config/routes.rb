Rails.application.routes.draw do

  get '', to: 'statics#landing', as: 'landing'

  devise_for :users

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
