class TagsController < ApplicationController
  def index
    @sort_type = params[:sort] || 'popular'
    @query     = Tag.order_by(@sort_type).ransack(params[:q])
    @tags      = @query.result.page(params[:page])
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tagged_questions = Question.includes(%i[user tags])
                            .tagged_with(@tag.name)
                            .recent
  end
end
