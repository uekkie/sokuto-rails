Rails.application.routes.draw do
  root to: "questions#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :questions, only: %i(index show) do
    collection do
      get 'tagged/:tag_name', to: 'questions#tagged'
    end
    resources :answers, only: %i(new create)
  end

  resources :tags, only: %i(index)

  resources :users, only: %i(index show)

  namespace :loggedin do
    resources :questions, only: %i(new create edit update destroy) do
      member do
        put "upvote", to: "questions#upvote"
        put "downvote", to: "questions#downvote"
      end
    end
    resources :users, only: %i(edit update)
  end
end
