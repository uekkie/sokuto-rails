class TagsController < ApplicationController
  def index
    # TODO: 人気タブ、名前タブ、新規タブを実装する
    @q = ActsAsTaggableOn::Tag.ransack(params[:q])
    @tags = @q.result.page(params[:page])
  end
end
