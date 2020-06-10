Rails.application.routes.draw do
  # rootをログイン画面に設定
   devise_scope :user do
     root "users/sessions#new"
   end
 
   devise_for :users, :controllers => {
     sessions: 'users/sessions'
   }
 
  resource :user do
    resources :genres, only: [:index, :new, :create]
  end


end
