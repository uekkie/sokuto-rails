class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show)

  def index
    @sort_type = params[:sort] || 'newest'
    @questions = Question.sort_type_is(@sort_type).page(params[:page]).includes(:user)
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
