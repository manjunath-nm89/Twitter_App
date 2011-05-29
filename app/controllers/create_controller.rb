class CreateController < ApplicationController

  def signup
    @title = "Signup"
    @user=User.new
  end
  
  def users
    
  end

end
