Rails.application.routes.draw do
  root 'welcome#home'
  get 'users/sign_up' => 'users#new'
  post 'users/sign_up' => 'users#create'
  get 'users/sign_in' => 'sessions#new'
  post 'users/sign_in' => 'sessions#create'
  get 'users/:id' => 'users#show', as: :user
  delete 'logout' => 'sessions#destroy'
end
