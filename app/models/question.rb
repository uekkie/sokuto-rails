class Question < ApplicationRecord
  validates :title, presence: true
  acts_as_ordered_taggable
  acts_as_votable

  belongs_to :user
  has_many :answers, dependent: :destroy

  scope :recent_with_user, -> {
    includes(:user).order(created_at: :desc)
  }

  scope :weighted_total, -> {
    order(cached_weighted_total: :desc)
  }
  scope :no_answers, -> {
    where(answers_count: 0).order(created_at: :desc)
  }
end
