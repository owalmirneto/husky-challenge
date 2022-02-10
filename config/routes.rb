# frozen_string_literal: true

Rails.application.routes.draw do
  root 'invoices#index'

  resource :sessions, only: [:new, :create, :destroy]

  resource :tokens, only: [:new, :create]

  resources :invoices
end
