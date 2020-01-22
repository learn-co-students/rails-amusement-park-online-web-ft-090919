module AttractionsHelper
  def attraction_li(attraction)
    message = current_user.admin? ? "Show " : "Go on "
    message += attraction.name
    link_to message, attraction_path(attraction)
  end
end
