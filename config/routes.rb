Rails.application.routes.draw do
  root to: "questions#index"
  devise_for :users

  resources :questions, only: %i(index show)
  resources :tags, only: %i(index show)

  resources :users do
    resources :questions, module: :users
  end
end
