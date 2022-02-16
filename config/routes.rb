# frozen_string_literal: true

Rails.application.routes.draw do
  root 'invoices#index'

  resource :sessions, only: [:new, :create, :destroy]
  get 'sessions/:id', to: 'sessions#show', as: :session

  resource :tokens, only: [:new, :create]

  resources :invoices, except: [:edit, :update]

  namespace :api do
    namespace :v1 do
      resources :invoices, except: [:edit, :update, :destroy]
    end
  end
end
