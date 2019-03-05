Rails.application.routes.draw do
  get 'tags/show'
  get 'tags/index'
  root to: "questions#index"
  devise_for :users

  resources :questions, only: %i(index show)
  resources :tags, only: %i(index show)

  resources :users do
    resources :questions
  end
end
