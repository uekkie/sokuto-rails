class Loggedin::VotesController < Loggedin::ApplicationController
  before_action :set_question, only: %i[up_vote down_vote]

  def up_vote
    @question.upvote_by current_user
    # @question.user.credit_score+=5
    # @question.user.save!
    redirect_to question_url(@question)
  end

  def down_vote
    @question.downvote_by current_user
    redirect_to question_url(@question)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
