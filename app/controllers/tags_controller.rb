class TagsController < ApplicationController
  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result.page(params[:page])
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tagged_questions = Question.includes([:user, :tags]).tagged_with(@tag.name).order(created_at: :desc)
  end
end
