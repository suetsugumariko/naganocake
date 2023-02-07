
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
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    resources :homes,only: [:top,:about]
    resources :items,only: [:index,:show]
    # resources :registrations,only: [:new,:create]
    # resources :sessions,only: [:new,:create,:destroy]
    resources :customers,only: [:show,:edit,:update,:unsubscribe,:withdaw]
    resources :cart_items,only: [:index,:update,:destory,:destory_all,:create]
    resources :orders,only: [:new,:comfirm,:complete,:create,:index,:show]
    resources :addresses,only: [:index,:edit,:new,:update,:destory]

  end

  namespace :admin do
  # resources :sessions,only: [:new,:create,:destroy]
   get '/' => 'homes#top'

   resources :items,only: [:index,:new,:create,:show,:edit,:update]
   resources :genres,only: [:index,:create,:edit,:update]
   resources :customers,only: [:index,:show,:edit,:update]
   resources :orders,only: [:show,:update]
   resources :orders_details,only: [:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root to: "public/homes#top"





end
