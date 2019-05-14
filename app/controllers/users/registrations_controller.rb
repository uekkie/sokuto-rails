class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :update]
  # update は利用されていないのでは？
  # 逆に loggedin/users_controller は不要にならないか？
  # もしくは機能をしっかり役割分担させて画面を分ける

private
  def configure_permitted_parameters
    # https://github.com/plataformatec/devise#strong-parameters
    # 特に理由なければこっちの書き方が良いと思う
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    #   user_params.permit(:name, :email, :password, :password_confirmation)
    # end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :email, :password_confirmation, :current_password)
    end
  end
end
