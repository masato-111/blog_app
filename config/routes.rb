Rails.application.routes.draw do
  devise_for :users

  #get "posts/new", to: 'posts#new', as: new_post
  #post "posts/new", to: 'posts#create'
  #get "posts", to: 'posts#index', as: posts
  #get "posts/:id", to: 'posts#show', as:post
  resources :posts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
