Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  
  #root to: 'home#posts'
  root to: 'posts#index'
  #root :to => "pages#home"

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
