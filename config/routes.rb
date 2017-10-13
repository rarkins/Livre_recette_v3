LivreRecettesV3::Application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  resources :categories
  resources :comments

  resources :recettes do
    resource :comments
  end

  match '/home' => 'recettes#home', :via => [:get]

  devise_for :users
  resources :users do
    resource :comments
  end

  root :to => 'recettes#index'
end
