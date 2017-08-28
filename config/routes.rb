Rails.application.routes.draw do

  namespace :admin do
    resources :articles
    resources :authors
    resources :comments
    resources :tags
    resources :taggings

    root to: "articles#index"
  end

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'articles#home'

  resources :articles do
    resources :comments
  end

  resources :tags
  resources :authors
  resources :author_sessions, only: [:new, :create, :destroy]
  resources :archive

  get 'login'    => 'author_sessions#new'
  get 'logout'   => 'author_sessions#destroy'
  get 'popular'  => 'articles#popular'
end
