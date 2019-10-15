Rails.application.routes.draw do
  root to: "homes#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :homes, only: %i(index)

  resources :questions, only: %i(index show)

  resources :tags, only: %i(index show)

  resources :users, only: %i(index show)

  namespace :loggedin do
    resources :questions, only: %i(new create edit update destroy) do
      member do
        put "up_vote", to: "votes#up_vote"
        put "down_vote", to: "votes#down_vote"
      end
      resources :answers, only: %i(create edit update destroy)
    end
    resources :users, only: %i(edit update)
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/lo'
  end
end
