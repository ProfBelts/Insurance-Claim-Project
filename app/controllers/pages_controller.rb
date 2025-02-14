class PagesController < ApplicationController
  before_action :authenticate_user_or_admin! # Require authentication for all other actions
  before_action :authenticate_admin!, only: [:manage_claim, :user_list]
  before_action :authenticate_user!, only: [:transactions]
  def home
    reset_session
  end

  def claim 
    @claim = Claim.new
  end

  def user_list
    @claims = Claim.where(status: ["approved", "rejected"])
  end

  def manage_claim
    @claims = Claim.all
  end

  def transactions
    @claims = Claim.where(user_id: current_user.id).order(created_at: :desc)
  end

  def authenticate_user_or_admin!
    unless admin_signed_in? || user_signed_in?
      redirect_to new_session_path(:user), alert: "You must be logged in to access this page."
    end
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      render file: Rails.public_path.join("403.html"), status: :forbidden, layout: false
    end
  end

  def authenticate_user!
    unless user_signed_in?
      render file: Rails.public_path.join("403.html"), status: :forbidden, layout: false
    end
  end


end
