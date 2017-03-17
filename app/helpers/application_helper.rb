module ApplicationHelper
  def flash_class(level)
     case level.to_sym
     when :notice then "alert alert-info"
     when :success then "alert alert-success"
     when :error then "alert  alert-danger"
     when :alert then "alert alert-warning"
     end
  end

  def active_page(active_page)
     @active == active_page ? 'active' : ''
  end
end
