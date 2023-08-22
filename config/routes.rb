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
  get 'my_ads', to: 'pages#my_ads'
  get 'triathlon2023', to: 'pages#triathlon2023'
  get 'forum_sports', to:'pages#forum_sports'
  get 'divers', to: 'pages#divers'
  get 'subscription', to: 'pages#subscription'

  get 'sportswears', to: 'products#sportswears'
  get 'petites_annonces', to: 'products#petites_annonces'

  get 'finances', to: 'clubs#finances'
  get 'impots', to: 'clubs#impots'
  get 'la_division_3', to: 'd3_contests#division_3'

  # Google API test
  get '/redirect', to: 'calendar#redirect', as: 'redirect'
  get '/callback', to: 'calendar#callback', as: 'callback'
  get '/calendars', to: 'calendar#calendars', as: 'calendars'
  get '/events', to: 'calendar#events', as: 'events'



  resources :pictures, only: [:index, :new, :create, :show, :edit, :update]
  #TODO create update method

  resources :users
  resources :dashboards, only: [:index]
  resources :articles do
    resources :reviews, only: [:new, :create]
    resources :likes, only: [:new, :create, :update]
    resources :participations, only: [:new, :create, :destroy]
  end
  resources :products, only: [:new, :show, :create, :edit, :update]
  resources :clubs, only: [:index, :new, :edit, :show, :create, :update]
  resources :tests, only: [:index, :new, :create]
  resources :notifications, only: [:index, :edit, :update]
  resources :newsletters, only: [:index, :edit, :update]

  resources :d3_contests
  resources :d3_results
  resources :partners
  resources :workouts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.member } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
