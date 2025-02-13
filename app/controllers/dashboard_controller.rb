class DashboardController < ApplicationController
    before_action :authenticate_user_or_admin!
  
    def user
    end
  
    def admin
    end
  
    private
  
    def authenticate_user_or_admin!
      unless admin_signed_in? || user_signed_in?
        redirect_to new_session_path(:user), alert: "You must be logged in to access this page."
      end
    end
  end
  