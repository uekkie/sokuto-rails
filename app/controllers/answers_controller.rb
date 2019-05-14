class AnswersController < ApplicationController
  before_action :set_question, only: %i(create)

  # loggedin の中になくて良いのか？
  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to question_url(@question), notice: '回答を投稿しました'
    else
      # 回答なしで投稿した場合、answers/new のみになる(質問が表示されない)
      render :new # Ajax にするか、questions/:id にしないといけないかも
    end
  end

private
  # create からしか呼ばれないのでメソッド化する必要はない
  # 作成者の好みによる
  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
