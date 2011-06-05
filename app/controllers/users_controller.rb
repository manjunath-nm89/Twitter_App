class UsersController < ApplicationController

  before_filter :authenticate,:only => [:index,:edit,:update]
  before_filter :check_user,:only   => [:edit,:update]  

  def index
    @title="Users"
    @users=User.paginate(:page=>params[:page])
  end  
  
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
      session[:return_back]=request.fullpath
      redirect_to signin_path unless signed_in?
    end
    
    def check_user
      @user=User.find_by_id(params[:id])   
      redirect_to current_user unless @user == current_user
    end
  
end
