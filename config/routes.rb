Rails.application.routes.draw do
  get 'contact_us/index'
  get 'contact_us/show'
  root to: 'users#top'
  devise_for :admins
  devise_for :users
  get 'admins/top' => 'admins#top'
  get 'about/top' => 'about#top'
  resources :genres
  resources :articles
  resources :notices
  resources :contact_us
  get 'users/top' => 'users#top'
  resources :users, only: [:index, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
