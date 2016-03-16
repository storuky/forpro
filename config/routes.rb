Rails.application.routes.draw do
  namespace :admin do
  get 'rubrics/index'
  end

  namespace :admin do
  get 'rubrics/new'
  end

  namespace :admin do
  get 'rubrics/edit'
  end

  namespace :admin do
  get 'properties/index'
  end

  namespace :admin do
  get 'properties/new'
  end

  namespace :admin do
  get 'properties/edit'
  end

  root to: "home#index"

  get "sitemap.xml" => "home#sitemap", format: :xml, as: :sitemap
  get "robots.txt" => "home#robots", format: :text, as: :robots

  resources :users do
    collection do
      put "locale"
    end
  end

  resources :positions do
    member do
      put "touch"
    end
  end

  get "search" => "search#index"
  get "about" => "about#index"

  scope :uploads, controller: "uploads" do
    post "files"
    post "logo"
  end
end
