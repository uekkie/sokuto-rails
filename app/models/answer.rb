class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true

  acts_as_votable

  validates :content, presence: true
end
