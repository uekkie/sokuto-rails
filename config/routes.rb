Rails.application.routes.draw do
  get 'homes/index'
  root to: "questions#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :questions, only: %i(index show)

  resources :tags, only: %i(index show)

  resources :users, only: %i(index show)

  namespace :loggedin do
    resources :questions, only: %i(new create edit update destroy) do
      member do
        put "up_vote", to: "votes#up_vote"
        put "down_vote", to: "votes#down_vote"
      end
      resources :answers, only: %i(create)
    end
    resources :users, only: %i(edit update)
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/lo'
  end
end
