class AdminsController < ApplicationController
    def new
      redirect_to new_admin_session_path, allow_other_host: true
    end
  end
  