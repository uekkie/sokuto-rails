class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show)

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result.page(params[:page]).includes(:user)
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order(:created_at).includes(:user)
  end

  def tagged
    @tag_name = params[:tag_name]
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
