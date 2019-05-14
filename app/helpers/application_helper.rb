module ApplicationHelper
  def is_active_params(param_name)
    # ransack のクエリにパラメータを移したのでアクティブなタブの判定ができなくなっている
    # 処理方法、検討中
    @sort_type == param_name ? "active" : ""
  end

  def avatar_image(user, **options)
    image_tag InitialAvatar.avatar_data_uri(user.name.first), options
  end
end
