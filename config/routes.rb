Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :news
  resources :source
end
