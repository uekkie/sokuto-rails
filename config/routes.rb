Rails.application.routes.draw do
  root to: "questions#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :questions, only: %i(index show) do
    collection do
      get 'tagged/:tag_name', to: 'questions#tagged'
    end
    resources :answers, only: %i(create)
  end

  resources :tags, only: %i(index)

  resources :users, only: %i(index show)

  namespace :loggedin do
    resources :questions, only: %i(new create edit update destroy) do
      member do
        put "up_vote", to: "votes#up_vote"
        put "down_vote", to: "votes#down_vote"
      end
    end
    resources :users, only: %i(edit update)
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/lo'
  end
end
