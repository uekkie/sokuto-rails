class Question < ApplicationRecord
  validates :title, presence: true
  acts_as_taggable

  belongs_to :user, dependent: :destroy
end
