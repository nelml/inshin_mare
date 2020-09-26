Rails.application.routes.draw do
  root to: 'users#top'
  devise_for :admins
  devise_for :users
  get 'admins/top' => 'admins#top'
  get 'about/top' => 'about#top'
  resources :genres
  resources :articles
  resources :notices
  resources :users, only: [:index, :show, :edit]
  get 'users/top' => 'users#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
