Rails.application.routes.draw do
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
