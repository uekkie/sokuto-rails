class HomesController < ApplicationController

  def index
    @query_type = params[:order] || params[:filter] || 'popular'

    @questions = Question
                     .filter_by(params[:filter])
                     .order_by(params[:order])
                     .page(params[:page])
                     .includes(%i[user tags])

  end
end
