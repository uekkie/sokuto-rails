class Question < ApplicationRecord
  acts_as_ordered_taggable
  acts_as_votable

  validates :title, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy

  scope :with_tagged_questions, lambda {|tag_name|
    includes(:user).tagged_with(tag_name).order(created_at: :desc)
  }

  def truncated_content
    content.truncate(40)
  end

  def persisted_answers
    answers.where.not(id: nil).includes(:user).order(:created_at)
  end
end
