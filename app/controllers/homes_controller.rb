class HomesController < ApplicationController

  def index
    @questions = Question
                     .filter_by(params[:filter])
                     .order_by(params[:order])
                     .page(params[:page])
                     .includes(%i[user tags])

  end
end
