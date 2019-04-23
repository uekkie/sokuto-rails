module ApplicationHelper
  def is_active_params(param_name)
    @sort_type == param_name ? "active" : ""
  end

  def avatar_image(user, **class_name)
    image_tag InitialAvatar.avatar_data_uri(user.name.first), class_name
  end
end
