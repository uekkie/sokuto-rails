class Question < ApplicationRecord
  acts_as_ordered_taggable
  acts_as_votable
  is_impressionable :counter_cache => true, :column_name => :impressions_count

  validates :title, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy

  scope :with_tagged_questions, lambda {|tag_name|
    includes(:user).tagged_with(tag_name).order(created_at: :desc)
  }

  scope :newer_tag_ids, -> {
    order(created_at: :desc).includes(:tags).pluck(:tag_id).compact.uniq
  }

  scope :recent, -> {
    order(created_at: :desc)
  }
  scope :no_answers, -> {
    where(answers_count: 0)
  }

  scope :in_week, -> {
    where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
  }
  scope :in_month, -> {
    where(created_at: 1.month.ago.beginning_of_day..Time.zone.now.end_of_day)
  }
  scope :filter_by, ->(filter) {
    case filter
    when 'in_week'
      in_week.recent
    when 'in_month'
      in_month.recent
    end
  }
  scope :order_by, ->(type) {
    case type
    when 'no_answer'
      no_answers.order(created_at: :asc)
    when 'votes'
      order(cached_votes_score: :desc)
    when 'popular'
      order(
        { cached_weighted_score: :desc },
        { impressions_count: :desc },
        { answers_count: :desc }
      )
    end
  }

  def truncated_content
    content.truncate(40)
  end

  def persisted_answers
    answers.where.not(id: nil).includes(:user).order(:created_at)
  end

  def popular_score
    answers_count + impressions_count + cached_weighted_score
  end
end
