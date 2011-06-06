class MicropostsController < ApplicationController

  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy

  def create
    @title="Tweets"
    @micropost=current_user.microposts.build(params[:micropost])
    if @micropost.save
      redirect_to statuspost_path,:flash=>{:success=>"Tweet successfully posted !!"}
    else
      redirect_to statuspost_path,:flash=>{:error=>"Tweet Post Failed !!! Restrict Tweet Post length between 1 .. 140 characters"}
    end
  end

  def destroy
    @micropost.destroy
    redirect_to @micropost.user,:flash=>{:success=>"Tweet Deleted"}
  end

  private

    def authorized_user
      @micropost=Micropost.find(params[:id])
      redirect_to current_user unless current_user == @micropost.user
    end

end
