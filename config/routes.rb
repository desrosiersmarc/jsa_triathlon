Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'calendar', to: 'pages#calendar'
  get 'club_events', to: 'pages#club_events'
  get 'trainings', to: 'pages#trainings'
  get 'contests', to: 'pages#contests'
  get 'school', to: 'pages#school'
  get 'results', to: 'pages#results'
  get 'my_articles', to: 'pages#my_articles'



  resources :pictures, only: [:index, :new, :create, :show, :edit, :update]
  #TODO create update method
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
