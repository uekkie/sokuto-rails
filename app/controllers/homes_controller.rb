class HomesController < ApplicationController

  def index
    order      = params[:order]
    filter     = params[:filter]
    @questions = Question
                     .filter_by(filter)
                     .order_by(order)
                     .page(params[:page])
                     .includes(%i[user tags])

  end
end
