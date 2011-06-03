SignupApp::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new,:create,:destroy]

  match "/welcome", :to => "create#welcome"
  match "/signin",  :to => "sessions#new"
  match "/signout", :to => "sessions#destroy"
  
  root :to => "users#new"

end
