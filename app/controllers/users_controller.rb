class UsersController < ApplicationController

  def new
    @title = "Signup"
    @user=User.new
  end

  def create
    @title="Signup"
    @user=User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user=User.find(params[:id])
    @title="#{@user.name}"
  end
  
end
