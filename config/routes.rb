SignupApp::Application.routes.draw do


  resources :users do
    member do
      get :followers,:following
    end
  end

  resources :sessions,      :only => [:new,:create,:destroy]
  resources :microposts,    :only => [:create,:destroy,:new]
  resources :relationships, :only => [:create,:destroy]

  match "/welcome",     :to => "create#welcome"
  match "/signin",      :to => "sessions#new"
  match "/signout",     :to => "sessions#destroy"
  match "/EditProfile", :to => "users#edit"
  match "/statuspost",  :to => "create#home"
  
  root :to => "users#new"

end
