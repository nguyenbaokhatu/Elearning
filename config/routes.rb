# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#home'
  get 'users/sign_up' => 'users#new'
  post 'users/sign_up' => 'users#create'
  get 'users/sign_in' => 'sessions#new'
  post 'users/sign_in' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users, only: [:show, :edit, :update]
  resources :categories, only: [:index]
  namespace :admin do
    resources :categories
    resources :words, only:[:index, :new, :create]
  end
end
