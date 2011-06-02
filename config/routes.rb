SignupApp::Application.routes.draw do

  resources :users
  
  root :to => "users#new"
  
  match "/welcome",:to=>"create#welcome"
end
