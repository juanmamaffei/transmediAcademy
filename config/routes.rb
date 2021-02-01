Rails.application.routes.draw do
  
  resources :contents
  resources :courses do
    resources :chapters
  end

  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
