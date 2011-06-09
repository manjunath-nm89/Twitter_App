class CreateController < ApplicationController

  before_filter :authenticate

  def home
    @title="Post Tweets"
    @micropost=current_user.microposts.new
    #@feed_items=current_user.feed.paginate(:page=>params[:page],:per_page=>2)
    @feed_items=current_user.feed
    session[:deletion_path]=request.fullpath
  end

end
