
Rails.application.routes.draw do

 #顧客用
  #URL/customers/sin_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }



  #管理者用
  #URL/admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :homes,only: [:top,:about]
    resources :items,only: [:index,:show]
    # resources :registrations,only: [:new,:create]
    # resources :sessions,only: [:new,:create,:destroy]
    # resources :customers,only: [:show,:edit,:update,:unsubscribe,:withdaw]
    get '/customers/my_page' => 'customers#show'
    get '/customers/infomation/edit' => 'customers#edit'
    patch '/customers/infomation' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'

    resources :cart_items,only: [:index,:update,:create]
    delete '/cart_items/:id' => 'cart_items#destroy'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

    resources :orders,only: [:new,:create,:index,:show]
    post '/orders/confirm' => 'orders#comfirm'
    get '/orders/complete' => 'orders#complete'

    resources :addresses,only: [:index,:edit,:update]
    post '/addresses' => 'addresses#new'
    delete '/addresses/id' => 'addresses#destroy'

  end

  namespace :admin do
   #resources :sessions,only: [:new,:create,:destroy]
   get '/' => 'homes#top'

   resources :items,only: [:index,:new,:create,:show,:edit,:update]
   resources :genres,only: [:index,:create,:edit,:update]
   resources :customers,only: [:index,:show,:edit,:update]
   resources :orders,only: [:show,:update]
   patch '/admin/orders/:order_id/order_details/:id' => 'orders_details#update'
   #resources :orders_details,only: [:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html







end
