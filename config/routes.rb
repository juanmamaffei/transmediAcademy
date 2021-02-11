Rails.application.routes.draw do
  

  resources :matriculations
  resources :contents do
    resources :user_contents do
      member do
        put "like" => "user_contents#like"
      end
    end
    resources :tests do
      post "corregir" => "tests#corregir"
    end
  end
  
  resources :courses do
    resources :chapters
  end

  devise_for :users
  root 'home#index'
  get 'mycourses', to: 'courses#mycourses'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
