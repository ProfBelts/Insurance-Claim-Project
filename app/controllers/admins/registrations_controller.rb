class Admins::RegistrationsController < Devise::RegistrationsController
    
    def new
        redirect_to new_admin_session_path and return
        super
    end

    def update
        redirect_to admin_dashboard_path and return
    end

end
