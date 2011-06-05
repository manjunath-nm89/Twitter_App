class UsersController < ApplicationController

  before_filter :authenticate,:only=>[:edit,:update]

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

  def edit
    @user=User.find(params[:id])
    @title="Edit Profile"
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      @title="Edit Profile"
      render "edit"
    end
  end
  
  private
  
    def authenticate
      redirect_to signin_path unless signed_in?
    end
  
end
