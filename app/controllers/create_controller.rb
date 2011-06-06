class CreateController < ApplicationController

  before_filter :authenticate

  def home
    @title="Post Tweets"
    @micropost=Micropost.new 
  end

end
