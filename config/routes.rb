Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'pages#home'
  get 'calendar', to: 'pages#calendar'
  get 'club_events', to: 'pages#club_events'
  get 'trainings', to: 'pages#trainings'
  get 'contests', to: 'pages#contests'
  get 'school', to: 'pages#school'
  get 'results', to: 'pages#results'
  get 'my_articles', to: 'pages#my_articles'
  get 'my_ads', to: 'pages#my_ads'

  get 'sportswears', to: 'products#sportswears'
  get 'petites_annonces', to: 'products#petites_annonces'

  get 'finances', to: 'clubs#finances'
  get 'impots', to: 'clubs#impots'


  # Google API test
  get '/redirect', to: 'calendar#redirect', as: 'redirect'
  get '/callback', to: 'calendar#callback', as: 'callback'
  get '/calendars', to: 'calendar#calendars', as: 'calendars'
  get '/events', to: 'calendar#events', as: 'events'



  resources :pictures, only: [:index, :new, :create, :show, :edit, :update]
  #TODO create update method
  resources :articles do
    resources :reviews, only: [:new, :create]
  end
  resources :products, only: [:new, :show, :create, :edit, :update]
  resources :clubs, only: [:index, :new, :edit, :show, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
