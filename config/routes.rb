Rails.application.routes.draw do
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'customers/edit'
    get 'customers/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'address/index'
    get 'address/edit'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
    get 'homes/search'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
	devise_for :admin, controllers: {
		sessions: "admin/sessions",
	}

	namespace :admin do
		get "top" => "home#top", as: "top"
		get "search" => "home#search", as: "search"
		get "customers/:customer_id/orders" => "orders#index", as: "customer_orders"
		resources :customers, only: [:index, :show, :edit, :update]
		resources :items, except: [:destory]
		# "except"は７つの基本アクション中、不要なものを指定する。"only"は必要なものを指定する。
		resources :genres, only: [:index, :create, :edit, :update]
		resources :orders, only: [:index, :show, :update] do
			resources :orders_details, only: [:update]
		end
		# "resources do"を用いて、ルーディングのネストをしている。
		# ネストすると、URLの階層構造ができ、関係性のあるもの同士紐づけることができる。
		# 参考文献：（https://techtechmedia.com/routing-nest-rails/）
	end

	devise_for :customers, controllers: {
		sessions: "public/sessions",
		registrations: "public/registrations",
	}

	scope module: :public do
	# "scope module: :public"とすることで、URLはそのままにファイル構成のみ指定のパスに設定できる。
	# 参考文献：（https://qiita.com/ryosuketter/items/9240d8c2561b5989f049）
		root "items#top"
		get "customers/mypage" => "customers#show", as: "mypage"
		get "customers/information/edit" => "customers#edit", as: "edit_information"
		patch "customers/information" => "customers#update", as: "update_information"
		put "customers/information" => "customers#update"
		get "customers/unsubscribe" => "customers#unsubscribe", as: "confirm_unsubscribe"
		patch "customers/withdraw" => "customers#withdraw", as: "withdraw_customer"
		put "customers/withdraw" => "customers#withdraw"
		delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all_cart_items"
		post "orders/confirm" => "orders#confirm"
		get "orders/confirm" => "orders#error"
		get "orders/thanks" => "orders#thanks", as: "thanks"

		resources :address, only: [:index, :create, :edit, :update, :destroy]
		resources :items, only: [:index, :show] do
			resources :cart_items, only: [:create, :update, :destroy]
		end
		resources :cart_items, only: [:index]
		resources :orders, only: [:new, :index, :create, :show]
	end
end
