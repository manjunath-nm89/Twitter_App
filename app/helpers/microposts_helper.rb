module MicropostsHelper

  def nested_posts(microposts)
    microposts .map do |message,sub_messages|
      render(message)+content_tag(:div,nested_posts(sub_messages),:class=>"nested_messages")
    end.join.html_safe
  end

  def nested_feed_posts(microposts)
    microposts .map do |message,sub_messages|
    render(:partial => 'layouts/feeds', :locals => {:f => message} )+content_tag(:div,nested_posts(sub_messages),:class=>"nested_messages")
    end.join.html_safe
  end

end


