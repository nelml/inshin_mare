Rails.application.routes.draw do

  get 'tests/test1'
  get 'tests/test2'
  get 'tests/test3'
  root to: 'users#top'
  devise_for :admins
  devise_for :users
  get 'admins/top' => 'admins#top'
  get 'about/top' => 'about#top'
  resources :genres
  resources :articles
  resources :notices
  resources :contacts
  get 'users/top' => 'users#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :comments, only: [:create, :destroy]
  resources :favgenres, only: [:create, :destroy]
  resources :favarticles, only: [:create, :destroy]
  get 'tests/test1' => 'tests#test1', as: 'test1'
  get 'tests/test2' => 'tests#test2', as: 'test2'
  get 'tests/test3' => 'tests#test3', as: 'test3'
  get 'versions/0_1_1' => 'versions#ver0_1_1', as: 'v0_1_1'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
