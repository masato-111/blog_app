Rails.application.routes.draw do

  #get "posts/new", to: 'posts#new', as: new_post
  #post "posts/new", to: 'posts#create'
  #get "posts", to: 'posts#index', as: posts

  resources :posts

end
