Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  
  #root to: 'home#posts'
  root to: 'posts#index' #best default route
  #root :to => "pages#home"

  #authenticated :user do
  #  root 'posts#index', as: :authenticated_root
  #end

  #root "home#index"

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
