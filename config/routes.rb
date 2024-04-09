Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'genres/index'
  end
  namespace :admin do
    get 'foods/index'
    get 'foods/show'
  end
  namespace :public do
    get 'relationships/followed'
    get 'relationships/follower'
  end
  namespace :public do
    get 'dms/index'
    get 'dms/show'
  end
  namespace :public do
    get 'foods/new'
    get 'foods/index'
    get 'foods/show'
    get 'foods/edit'
  end
  namespace :public do
    get 'users/mypage'
    get 'users/show'
    get 'users/edit'
    get 'users/foodindex'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    get 'homes/ideal'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
