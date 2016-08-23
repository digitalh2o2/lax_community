Rails.application.routes.draw do
  resources :fields
  resources :comments
  resources :events
  devise_for :users

  root 'welcome#home'
end
