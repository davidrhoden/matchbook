module ApplicationHelper

  def title
    base_title = "R&R Matchbook"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Rock and Roll Matchbook", :class => "round")
  end
  
end
