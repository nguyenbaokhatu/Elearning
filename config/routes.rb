Rails.application.routes.draw do
  root 'welcome#home'
  get 'users/sign_up' => 'users#new'
  post 'users/sign_up' => 'users#create'
end
