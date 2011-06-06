class UsersController < ApplicationController

  before_filter :authenticate,:only   => [:index,:edit,:update]
  before_filter :check_user,  :only   => [:edit,:update]
  before_filter :admin_user,  :only   => [:destroy]

  def index
    @title="Users"
    @users=User.paginate(:page=>params[:page],:per_page=>6)
  end  
  
  def new
    @title = "Signup"
    @user=User.new
    redirect_to current_user if signed_in?
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
    @microposts=@user.microposts.paginate(:page=>params[:page],:per_page=>4)
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

  def destroy
    destroy_user=User.find(params[:id])
     if !destroy_user.admin? && destroy_user.destroy
       redirect_to users_path,:flash=>{:success=>"User successfully Deleted !!"}
     else
       redirect_to users_path,:flash=>{:error=>"Unable to destroy user"}
     end
    
  end
  
  private
  
    
    
    def check_user
      @user=User.find_by_id(params[:id])   
      redirect_to current_user unless @user == current_user
    end

    def admin_user
      redirect_to current_user unless current_user.admin?
    end
  
end
