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

  scope :with_tagged_questions, lambda {|tag_name|
    includes(:user).tagged_with(tag_name).order(created_at: :desc)
  }

  def truncated_content
    content.truncate(40)
  end

  def humanize_created_at
    seconds = (Time.now - created_at).round;
    days = seconds / (60 * 60 * 24); return I18n.l(created_at, format: :short) if days > 0
    hours = seconds / (60 * 60); return "#{hours}時間前" if hours > 0
    minutes = seconds / 60; return "#{minutes}分前" if minutes > 0

    return "#{seconds}秒前"
  end
end
