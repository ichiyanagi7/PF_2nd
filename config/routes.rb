Rails.application.routes.draw do
  get 'diaries/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "about", to:'homes#about'

  get "login", to:"sessions#new"
  post "login", to:"sessions#create"

  resources :diaries, except:[:index]

end
