Rails.application.routes.draw do
  # rootをログイン画面に設定
   devise_scope :user do
     root "users/sessions#new"
   end
 
   devise_for :users, :controllers => {
     sessions: 'users/sessions'
   }
 
  resources :users, only: [:index,:edit, :update]
  resources :genres, only: [:index, :new, :create, :update] do
    resources :contents, only: [:index, :new, :create, :update]
  end
  
end
