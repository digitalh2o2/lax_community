Rails.application.routes.draw do
  root to: 'welcome#home'

  resources :fields
  resources :comments
  resources :events
  devise_for :users, controllers: { registrations: "registrations", :omniauth_callbacks => "callbacks"}

  resources :events do 
    resources :comments
  end
  resources :users

  
end
