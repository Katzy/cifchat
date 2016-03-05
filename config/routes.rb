Rails.application.routes.draw do


  root 'comments#index'

  devise_for :users

  resources :comments

end
