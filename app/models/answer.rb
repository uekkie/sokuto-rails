class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true

  acts_as_votable

  validates :content, presence: true

  def accepted_by(user)
    self.update!(accepted: true)
    self.user.update_credit_score
    user.accepted_answers << self
    user.save!
    user.update_credit_score
  end
end
