Rails.application.routes.draw do
  root to: "questions#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :questions, only: %i(index show) do
    collection do
      get 'tagged/:tagname', to: 'questions#tagged'
    end
  end

  resources :tags, only: %i(index)

  resources :users, only: %i(index show) do
    resources :questions, only: %i(new create edit update destroy)
  end

  resources :questions , only: %i(show index)do
    resources :answers, only: %i(new create)
  end
end
