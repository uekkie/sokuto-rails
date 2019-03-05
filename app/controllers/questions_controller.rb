class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_question, only: :show

  def index
    @questions = Question.all.includes(:tags).order(created_at: :desc)
  end

  def show
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end
end
