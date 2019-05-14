class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show)

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result.page(params[:page]).includes(:user)
  end

  def show
    @answer = Answer.new # @question.answers.build の方がよいかも views/answers/_form への引継ぎ合わせて検討を
  end

  def tagged
    @tag_name = params[:tag_name]
    # index アクションにまとめられるならまとめた方がよいと思う
    # REST のアクションに載せた方がいい
    # parameter で検索処理を変えたり

    # ここに検索処理をおいた方が処理のレイヤーが揃ってよいと思う
    # ページングは必要ないか？
  end

  private

  # 使用されていないプライベートメソッド => 消し忘れ
  # def question_params
  #   params.require(:question).permit(:title, :content, :tag_list)
  # end

  # tags への SQL が Question の数だけ発行されている。問題はないのか？

  def set_question
    @question = Question.find(params[:id])
  end
end
