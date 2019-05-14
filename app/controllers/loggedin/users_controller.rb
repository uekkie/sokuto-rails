class Loggedin::UsersController < Loggedin::ApplicationController
  def edit

  end

  def update
    # current_user を直接 update しない方がよい
    # 現在、使用している current_user の情報が抜けて、予期せぬエラーを引き起こす
    # なので、別途 user モデルを再取得した方がいい
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
