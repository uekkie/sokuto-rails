class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :update]

private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name introduce live_in))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name introduce live_in))
  end
end
