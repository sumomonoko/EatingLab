Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'ideal' => 'homes#ideal'
    resources :users, only: [:show, :edit, :update] do
      member do
        # 退会確認画面
        get :check
      end
      collection do
        # 論理削除用のルーティング
        patch :withdraw
      end
      resource :relationships, only: [:create, :destroy]
    	get "followings" => "relationships#followings", as: "followings"
    	get "followers" => "relationships#followers", as: "followers"

    end
    resources :foods, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :dms, only: [:index, :show, :create, :destroy]
    resources :relationships, only: [:followed, :follower]
    resources :relationships, only: [:followed, :follower, :create, :destroy]
    get "dms/room/information" => "dms#show"
    get '/genre/search' => 'searches#genre_search'
    get "search" => "searches#search"
  end

  namespace :admin do
    root to: 'homes#top'
    resources :foods, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :create, :destroy]
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get :foodindex
      end
    end
    get '/genre/search' => 'searches#genre_search'
    get "search" => "searches#search"
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
