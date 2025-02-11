class Users::RegistrationsController < Devise::RegistrationsController
    # before_action :configure_account_update_params, only: [:update]
   
    def create
        super do |user|
          if params[:user][:file].present?
            user.attachments.create(file: params[:user][:file], category: "profile_picture")
          end
        end
      end
    
      def update
        super do |user|
          if params[:user][:file].present?
            # Find existing profile picture or create a new one
            attachment = user.attachments.find_or_initialize_by(category: "profile_picture")
            attachment.file = params[:user][:file]
            attachment.save
          end
      
          # Redirect to user dashboard after successful update
          redirect_to user_dashboard_path and return
        end
      end
      
      
      

    

    protected

    def after_sign_up_path_for(resource)
        sign_out(resource) # Force logout after sign-up
        new_user_session_path # Redirect to sign-in page
    end

end
