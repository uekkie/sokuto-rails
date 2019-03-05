class Question < ApplicationRecord
  validates :title, presence: true
  acts_as_ordered_taggable
  belongs_to :user
end
