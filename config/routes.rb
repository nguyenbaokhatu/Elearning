# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#home'
  get 'users/sign_up' => 'users#new'
  post 'users/sign_up' => 'users#create'
  get 'users/sign_in' => 'sessions#new'
  post 'users/sign_in' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users, only: [:show, :edit, :update] do
    resources :words, only: [:index]
  end
  resources :categories, only: [:index]

  resources :lessons, only: [:create, :show] do
    resources :lesson_words
  end

  namespace :admin do
    resources :categories do
      resources :words
    end
  end
end
