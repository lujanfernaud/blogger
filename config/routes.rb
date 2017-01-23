Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'articles#index'

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
