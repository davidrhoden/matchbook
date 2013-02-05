module ApplicationHelper

  def title
    base_title = "R&R Matchbook"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
