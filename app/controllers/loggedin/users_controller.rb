class Loggedin::UsersController < Loggedin::ApplicationController
  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to user_url(current_user), notice: "更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
