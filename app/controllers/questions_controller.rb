class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_question, only: %i(show edit update destroy)

  def index
    @questions = Question.all.includes(:tags).order(created_at: :desc)
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @user = current_user
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to @question, notice: "質問「#{@question.title}」を作成しました"
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "質問「#{@question.title}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: "質問「#{@question.title}」を削除しました"
  end

  def tagged
    @user ||= current_user if user_signed_in?
    @tag_name = params[:tagname]
    @questions = Question.tagged_with(@tag_name).order(created_at: :desc)
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :tag_list)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end
end
