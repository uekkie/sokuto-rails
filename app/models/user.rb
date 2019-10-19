class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy


  def credit_score
    [
        questions.map(&:cached_votes_up).inject(0, :+) * 5,
        answers.map(&:cached_votes_up).inject(0, :+) * 10,
        answers.where(accepted: true).count * 15,
        questions.select(&:has_accepted_answer?).count * 2,
    ].inject(0, :+)
  end
end
