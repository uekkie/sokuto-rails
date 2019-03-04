class Question < ApplicationRecord
  validates :title, presence: true
  acts_as_taggable
end
