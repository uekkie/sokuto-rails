module ApplicationHelper
  def avatar_image(user, **options)
    image_tag InitialAvatar.avatar_data_uri(user.name.first), options
  end
end
