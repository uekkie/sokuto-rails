class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true # validatable あるのに、なぜ自前で追加したのか？ Gem の動きを把握したほうがいい

  # 退会ユーザの質問や回答を消していいのか？検討してみてください。
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
end
