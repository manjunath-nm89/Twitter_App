class MicropostsController < ApplicationController

  before_filter :authenticate

  def create
    @title="Tweets"
    @micropost=current_user.microposts.build(params[:micropost])
    if @micropost.save
      redirect_to current_user,:flash=>{:success=>"Tweet successfully posted !!"}
    else
      flash.now[:error]="Tweet Post Failed !!! Restrict Tweet Post length between 1 .. 140 characters"
      render "create/home"
    end
  end

  def destroy

  end

end
