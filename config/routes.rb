Rails.application.routes.draw do
  get "admin_dashboard/index"
  # ログイン関連のルート（一般ユーザー向け）
  get "login", to: "admin_sessions#new", as: "login"
  post "login", to: "admin_sessions#create"
  delete "logout", to: "admin_sessions#destroy"

  # admin名前空間内のルート
  namespace :admin do
    # 管理者用ログインページのルート（admin名前空間内）
    get "login", to: "sessions#new", as: "login"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"

    # その他の管理者用リソースを追加
    resources :admin_sessions, only: [ :new, :create, :destroy ] # 重複回避
    resources :shops
    resources :tags
  end

  # home画面のルート
  root "shops#index"

  # 健康チェックのルート
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA関連のルート
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # 一般ユーザー向けのリソースルート
  resources :shops, only: [ :index, :new, :create, :destroy, :show ]
  resources :tags, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :admins, only: [ :new, :create ]
  resources :admin_sessions, only: [ :new, :create, :destroy ]
end
