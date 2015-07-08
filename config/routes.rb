Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "/", sign_out: "logout"}

  root :to => 'dashboard#index'
end
