Rails.application.routes.draw do
  devise_for :users
  root to: "application#index"
  resources :items do
    resources :orders, only: :index
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
