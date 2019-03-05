Rails.application.routes.draw do
  root to: "questions#index"
  devise_for :users

  resources :questions, only: %i(index show) do
    collection do
      get 'tagged/:tagname', to: 'questions#tagged'
    end
  end
  resources :tags, only: %i(index)

  resources :users do
    resources :questions, module: :users
  end
end
