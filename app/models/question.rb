class Question < ApplicationRecord
  validates :title, presence: true
  acts_as_ordered_taggable
  acts_as_votable

  belongs_to :user
  has_many :answers, dependent: :destroy

  scope :recent_with_user, -> {
    includes([:user, :taggings]).order(created_at: :desc)
  }

  scope :weighted_total, -> {
    order(cached_weighted_total: :desc)
  }

  scope :no_answers, -> {
    where(answers_count: 0).order(created_at: :desc)
  }

  scope :with_tagged_questions, lambda { |tag_name|
    includes(:user).tagged_with(tag_name).order(created_at: :desc)
  }

  def truncated_content
    content.truncate(40)
  end

  def humanize_created_at
    elapsed_at = Time.now - created_at

    return I18n.l(created_at, format: :within_hour) if elapsed_at < 1.hour
    return I18n.l(created_at, format: :within_day) if elapsed_at < 1.day
    return "昨日" if elapsed_at < 2.day
    return "2日前" if elapsed_at < 3.day

    I18n.l(created_at, format: :short)
  end
end
