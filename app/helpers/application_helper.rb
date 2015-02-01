module ApplicationHelper
  def is_mobile?
    return request.user_agent =~ /Mobile|webOS|Android/  
  end
end
