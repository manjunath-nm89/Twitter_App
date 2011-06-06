class CreateController < ApplicationController

  before_filter :authenticate

  def home
    @title="Post Tweets"
    @micropost=Micropost.new
    @feed_items=current_user.feed.paginate(:page=>params[:page],:per_page=>2)
  end

end
