Rails.application.routes.draw do
  devise_for :users
  root 'news#index'
  resources :news
  resources :source
end
