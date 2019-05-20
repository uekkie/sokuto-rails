module ApplicationHelper
  def avatar_image(user, **options)
    image_tag InitialAvatar.avatar_data_uri(user.name.first), options
  end

  def is_active_params(param_name)
    @query_type == param_name ? "active" : ""
  end
end
