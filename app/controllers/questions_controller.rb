class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show edit update destroy)

  def index
    @questions = Question.all.includes(:user).order(created_at: :desc)
  end

  def show
    @answer = Answer.new
  end

  def tagged
    @tag_name = params[:tagname]
    @questions = Question.tagged_with(@tag_name).order(created_at: :desc)
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :tag_list)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
