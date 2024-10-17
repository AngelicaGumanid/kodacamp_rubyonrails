Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"
  resources :posts do
    resources :comments, except: :show
  end
  resources :categories, except: :show
end
