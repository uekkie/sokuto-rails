class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]

  def index
    @query = Question.ransack(params[:q])
    @questions = @query.result.page(params[:page]).includes(%i[user tags])
  end

  def show
    @answer = @question.answers.build
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
