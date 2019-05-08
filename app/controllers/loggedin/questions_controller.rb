class Loggedin::QuestionsController < Loggedin::ApplicationController
  before_action :set_question, only: %i(edit update destroy)

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

  private

  def set_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :tag_list)
  end
end
