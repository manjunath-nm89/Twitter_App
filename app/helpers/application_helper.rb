module ApplicationHelper

  def title
  
    if @title.nil?
      @title="Twitter"
    else
      "Twitter | #{@title}"
    end
    
  end
  
end
