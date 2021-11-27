Rails.application.routes.draw do

  resources :users,except:[:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "about", to:'homes#about'

  get "login", to:"sessions#new"
  post "login", to:"sessions#create"
  delete "logout", to:"sessions#destroy"

  resources :diaries

  # get "/diaries/:id/archives/:yyyymm", to: "diaries#archives", as: :diary_archive

end
