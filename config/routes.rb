Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'ideal' => 'homes#ideal'
    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        # 退会確認画面
        get :check
      end

      collection do
        patch :withdraw
      end
    end
    resources :foods, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :dms, only: [:index, :show, :create, :destroy]
    resources :relationships, only: [:followed, :follower]
    resources :comments, only: [:create, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :relationships, only: [:followed, :follower, :create, :destroy]
    get "dms/room/information" => "dms#show"

    # 退会確認画面
    # get  '/users/check' => 'users#check'
    # 論理削除用のルーティング
    # patch  '/users/withdraw' => 'users#withdraw'

  end

  namespace :admin do
    root to: 'homes#top'
    resources :foods, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :create, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    get "admin/users/information/foods" => "admin#users#foodindex"
  end


  # 会員用
  # URL /customers/sign_in ...
  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
