class Loggedin::AnswersController < ApplicationController
  before_action :set_question, only: %i(create destroy)
  before_action :set_answer, only: %i(edit update destroy)

  def edit
  end

  def create
    @answer = @question.answers.build(answer_params) do |answer|
      answer.user = current_user
    end

    if @answer.save
      redirect_to question_url(@question), notice: '回答を投稿しました'
    else
      render 'questions/show'
    end
  end

  def update
    if !@answer.update(content: params[:answer][:content])
      @status = 'fail'
    end
  end

  def destroy
    @answer.destroy!
    redirect_to question_url(@question), notice: 'コメントを削除しました'
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
