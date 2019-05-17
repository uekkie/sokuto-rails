class TagsController < ApplicationController
  def index
    @query = Tag.ransack(params[:q])
    @tags = @query.result.page(params[:page])
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tagged_questions = Question.includes(%i[user tags]).tagged_with(@tag.name).order(created_at: :desc)
  end
end
