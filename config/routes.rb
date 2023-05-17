Rails.application.routes.draw do

  namespace :public do
    root to: "homes#top"
    get 'homes/about'
    resources :cart_items, only: [:index, :update, :destroy, :create]    #カート内商品一括削除all_destroy未記述
    resources :customers, only: [:show, :edit, :update]                   #退会処理withdraw未記述
    get 'customers/confirm_withdraw' =>"customers#confirm_withdraw"
    resources :items, only: [:index, :show]

    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create]


  end
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
