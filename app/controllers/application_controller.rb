class ApplicationController < ActionController::Base
  before_action :user_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource.role
    when 'user'
      users_root_path
    end
  end

  protected

  def user_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email age date_of_birth role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email age date_of_birth role])
 end

end
