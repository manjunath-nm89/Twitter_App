SignupApp::Application.routes.draw do
  root :to => "create#signup"
  
  match "/users",:to=>"create#users"
  
end
