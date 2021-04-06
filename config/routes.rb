Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
   post 'follow/:id' => 'relationships#follow', as: 'follow'
   post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    
    get 'followed' => 'relationships#followed', as: 'followed'
    get 'follower' => 'relationships#follower', as: 'follower'

  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end