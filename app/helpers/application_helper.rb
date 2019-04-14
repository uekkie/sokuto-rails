module ApplicationHelper
  def is_active_actions(param_name)
    params[:param_name].present? ? "active" : nil
  end

end
