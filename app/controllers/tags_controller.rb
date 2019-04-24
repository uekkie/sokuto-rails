class TagsController < ApplicationController
  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result.page(params[:page])
  end
end
