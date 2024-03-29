Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root :to => 'home#index'

  resources :dashboard, :except => [:index]
  resources :images do
    resources :comments, :except => [:index]
    resources :tags, :except => [:index]
  end

end
