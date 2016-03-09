Rails.application.routes.draw do
  root to: "home#index"
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

  scope :uploads, controller: "uploads" do
    post "files"
    post "logo"
  end
end
