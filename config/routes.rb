SignupApp::Application.routes.draw do

  resources :users
  
  root :to => "create#signup"
  
  match "/users",:to=>"create#users"
  match "/welcome",:to=>"create#welcome"
end
