Rails.application.routes.draw do

  # root to: 'articles#index'

  root 'clean_blogs#index'
  
  resources :articles do
    resources :comments
  end

  resources :tags
  resources :authors
  resources :author_sessions, only: [:new, :create, :destroy]
  resources :archive

  get 'login'   => 'author_sessions#new'
  get 'logout'  => 'author_sessions#destroy'
  get 'popular' => 'articles#popular'

  get  'about'    => 'clean_blogs#about'
  get  'post'     => 'clean_blogs#post'
  get  'contact'  => 'clean_blogs#contact'
end
