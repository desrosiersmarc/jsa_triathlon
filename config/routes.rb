Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'calendar', to: 'pages#calendar'
  resources :pictures, only: [:index, :new, :create]
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
