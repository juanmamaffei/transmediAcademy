Rails.application.routes.draw do
  
  resources :matriculations
  resources :contents do
    resources :user_contents
  end
  
  resources :courses do
    resources :chapters
  end

  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
