class Question < ApplicationRecord
  validates :title, presence: true # validate の位置はここでいいのか？記述順はガイドラインにあるので意識したほうがいい
  acts_as_ordered_taggable
  acts_as_votable

  belongs_to :user
  has_many :answers, dependent: :destroy

  # 呼び出す回数にもよるが scope 関数化しなくてもよいのではないか？
  scope :with_tagged_questions, lambda {|tag_name|
    includes(:user).tagged_with(tag_name).order(created_at: :desc)
  }

  # type は文字列で引き渡し？リクエストパラメータを直接指定している
  # enum 定義したほうがよいかも
  #
  # このメソッド自体、Ransackの機能でカバーできるのではないか？
  scope :sort_type_is, -> (type) {
    case type
    when 'no_answer'
      # sort_type メソッドなのに、絞り込みをしている
      where(answers_count: 0).order(:created_at)
    when 'votes'
      order(cached_votes_score: :desc)
    else
      order(created_at: :desc)
    end
  }

  def truncated_content
    content.truncate(40)
  end

  # View のヘルパーを使えば不要かもしれない: time_ago_in_words
  # https://qiita.com/izumin5210/items/9cf61e12f442eb1ce02a
  def humanize_created_at
    seconds = (Time.now - created_at).round
    days = seconds / (60 * 60 * 24); return I18n.l(created_at, format: :short) if days > 0
    hours = seconds / (60 * 60); return "#{hours}時間前" if hours > 0
    minutes = seconds / 60; return "#{minutes}分前" if minutes > 0

    "#{seconds}秒前"
  end
end
