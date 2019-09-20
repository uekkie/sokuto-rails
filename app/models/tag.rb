class Tag < ActsAsTaggableOn::Tag
  paginates_per 12

  scope :query_with, ->(type) {
    case type
    when 'new'
      # 質問の作成日順に
      # newer_tag_ids = Question.newer_tag_ids
      newer_tag_ids = Question.all.order(created_at: :desc).includes(:tags).pluck(:tag_id).compact.uniq
      where(id: [1, 3, 2]).order(["field(id, ?)", [1, 3, 2]])
    when 'name'
      order(name: :asc)
    else
      most_used
    end
  }
end
