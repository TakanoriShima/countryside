Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }
   
  devise_for :admins 
   
  resources :user_profiles
  
  resources :posts, except: [:new, :create]
  resources :posts_region
  resources :posts_business
  
  resources :post do
     resources :comments, except: [:show, :index]
  end
  
  resources :favorites, only: [:create, :destroy]
  
  resources :accounts, only: [:show]

  scope :admins do
    resources :tag_post_regions, only: [:new, :index]
    resources :category_resources, only: [:create, :edit, :update, :destroy]
    resources :category_issues, only: [:create, :edit, :update, :destroy]
  end
  
  resources :post_category_resources
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
