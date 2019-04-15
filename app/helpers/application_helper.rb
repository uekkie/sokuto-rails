module ApplicationHelper
  def is_active_params(param_name)
    @sort_type == param_name ? "active" : ""
  end
end
