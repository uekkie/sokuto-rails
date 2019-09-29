class Tag < ActsAsTaggableOn::Tag
  paginates_per 12

  scope :order_by, ->(type) {
    case type
    when 'new'
      order(created_at: :desc)

    when 'name'
      order(name: :asc)
    else
      most_used
    end
  }
end
