class Loggedin::VotesController < Loggedin::ApplicationController
  before_action :set_question, only: %i[up_vote down_vote]

  def up_vote
    # upvote_by 更新処理で例外になったらどうなるのか？
    # 例外処理はなくてよいのか？
    # 例外は握りつぶされないのか？分岐処理は必要ないか？
    # 掘り下げてみよう
    # => boolean が戻るようなので、エラー処理は分岐させないといけないみたい
    # https://github.com/ryanto/acts_as_votable/blob/master/lib/acts_as_votable/votable.rb
    # line: 98
    # gem の処理があやしく見える・・・
    #
    # 2票登録されるのはなぜか？
    # 原因特定したい
    @question.upvote_by current_user
    redirect_to question_url(@question)
  end

  def down_vote
    @question.downvote_by current_user
    redirect_to question_url(@question)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
