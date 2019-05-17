class Loggedin::UsersController < Loggedin::ApplicationController
  def edit

  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
