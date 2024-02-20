# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :events

  root 'events#index', only: %i[index create new]
end
