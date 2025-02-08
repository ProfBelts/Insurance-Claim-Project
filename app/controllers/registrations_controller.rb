class RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_sign_up_path_for(resource)
        sign_out(resource) # Force logout after sign-up
        new_user_session_path # Redirect to sign-in page
    end
  end
  