# frozen_string_literal: true

Rails.application.routes.draw do
  root 'invoices#index'

  resource :tokens, only: [:new, :create, :destroy]

  resources :invoices
end
