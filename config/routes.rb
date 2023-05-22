Rails.application.routes.draw do

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


  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :sessions, only: [:new, :create, :destroy]

  end

  scope module: :public do
    root to: 'homes#top'

    post 'orders/confirm'
    get 'homes/about'
    get 'orders/completed'
    get 'customers/confirm_withdraw' =>"customers#confirm_withdraw"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]    #カート内商品一括削除all_destroy未記述
          #退会処理withdraw未記述
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw', as: 'confirm_withdraw'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    get 'customers/information/edit' => 'customers#edit', as: 'customers_edit'
    patch 'customers/information/update' => 'customers#update', as: 'customers_update'
    get 'customers/information/show' => 'customers#show', as: 'customers_show'
    resources :items, only: [:index, :show]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

