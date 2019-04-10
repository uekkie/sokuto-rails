class UsersController < ApplicationController
  # TODO: user名以外にプロフィールの情報（居住地、スコア、得意分野）を表示する
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

end
