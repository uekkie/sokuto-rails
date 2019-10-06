module TagsHelper
  def active(param_name)
    return 'active' if (param_name == 'popular' && @sort_type.empty?)
    @sort_type == param_name ? 'active' : ''
  end
end
