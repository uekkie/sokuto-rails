class Users::QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  def new
    @user = current_user
    @question = Question.new
  end

  def edit
    @user = current_user
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    def set_question
      @question = current_user.questions.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content, :tag_list)
    end
end
