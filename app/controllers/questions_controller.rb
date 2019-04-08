class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show edit update destroy)

  def index
    # TODO: スマートに書き直したい
    @questions = Question.all.includes(:user).order(created_at: :desc)
    @weighted_total_questions = Question.all.order(cached_weighted_total: :desc)
    @no_answers_questions = Question.all.where(answers_count: 0).order(created_at: :desc)
  end

  def show
    @answer = Answer.new
  end

  def tagged
    @tag_name = params[:tag_name]
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
