class CreateController < ApplicationController

  def signup
    @title = "Signup"
    @user=User.new
  end
  
  def users
    @title="Signup"
    @user=User.new(params[:user])
    if @user.save
      redirect_to "welcome" ,@user
    else
      render "signup"
    end
  end

  def welcome
    @title="Welcome"
    
  end

end
