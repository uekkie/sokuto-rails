class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show)

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result.page(params[:page]).includes(:user)
  end

  def show
    @answer = Answer.new
  end

  def tagged
    @tag_name = params[:tag_name]
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :tag_list)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
