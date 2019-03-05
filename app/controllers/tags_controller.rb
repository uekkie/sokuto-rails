class TagsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
  end

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end
end
