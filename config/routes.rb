Rails.application.routes.draw do

  #顧客用
  #URL/customers/sin_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registations: "public/registrations",
    sessions: 'public/sessions'
  }



  #管理者用
  #URL/admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 root to: "homes#top"





end
