class HomesController < ApplicationController

  def index
    @query_type = params[:query] || 'popular'
    @questions  = Question.order_by(@query_type)
                      .page(params[:page])
                      .includes(%i[user tags])

  end
end
