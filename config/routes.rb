Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sqfor'

  root to: "home#index"

  get "sitemap.xml" => "home#sitemap", format: :xml, as: :sitemap
  get "robots.txt" => "home#robots", format: :text, as: :robots

  resources :users do
    collection do
      get "enter"
      put "locale"
      get "confirm"
      put "restore"
    end
  end

  resources :positions do
    member do
      put "touch"
    end
    collection do
      get "suitable", is_array: true
    end
  end

  get "search" => "search#index"
  get "about" => "about#index"

  scope :uploads, controller: "uploads" do
    post "files"
    post "logo"
  end

  namespace :admin do
    get "/" => 'home#index'
    get "/stats" => 'home#stats'
    resources :positions do
      member do
        put "moderate"
      end
    end
    resources :users
    resources :mailers
  end
end
