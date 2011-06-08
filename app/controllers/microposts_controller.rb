class MicropostsController < ApplicationController

  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy

  def create
    
    @title="Tweets"
    #raise params.inspect
    @micropost=current_user.microposts.build(params[:micropost])
    if @micropost.save
      redirect_to statuspost_path,:flash=>{:success=>"Tweet successfully posted !!"}
    else
      redirect_to statuspost_path,:flash=>{:error=>"Tweet Post Failed !!! Post cannot be blank"}
    end
  end

  def destroy
    @micropost.destroy
    redirect_to session[:deletion_path]||@micropost.user,:flash=>{:success=>"Tweet Deleted"}
  end

  def new
    #raise params.inspect
    @title="Comment"
    @micropost=current_user.microposts.new(:parent_id => params[:parent_id])
    #raise @micropost.parent_id
  end

  private

    def authorized_user
      @micropost=Micropost.find(params[:id])
      redirect_to current_user unless current_user == @micropost.user
    end

end
