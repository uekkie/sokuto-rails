class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_question, only: :show

  def index
    @questions = Question.all.includes(:tags).order(created_at: :desc)
  end

  def show
    @answer = Answer.new
    @user = current_user
  end

  def tagged
    @user ||= current_user if user_signed_in?
    @tag_name = params[:tagname]
    @questions = Question.tagged_with(@tag_name).order(created_at: :desc)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end
end
