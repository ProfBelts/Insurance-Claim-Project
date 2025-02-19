class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :gender, :profile_picture])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :gender, :profile_picture])
    end


    def after_sign_in_path_for(resource)
      stored_location_for(resource) ||
        case resource
        when current_admin
          admin_dashboard_path
        when current_user
          user_dashboard_path
        else
          super
        end
    end
    
    
    
end
  