Rails.application.routes.draw do
  devise_for :users

  # get 'pages/contact'
  get "contact", to: "pages#contact"
  # get 'pages/about'
  get "about", to: "pages#about"
  get 'error', to: 'pages#error'

  get "blog", to: redirect("http://google.com")

  get "home", to: 'pages#home'

  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'pages#home'

  get '*path', to: redirect('/error')
end