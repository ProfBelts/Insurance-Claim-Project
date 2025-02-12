class PagesController < ApplicationController
  def home
    reset_session
  end

  def claim 
    @claim = Claim.new
  end

  def user_list

    @users = User.all

  end

  def manage_claim
    @claims = Claim.all
  end

  def transactions
    if current_user 
      @claims = Claim.where(user_id: current_user.id)
    else
      redirect_to root_path, alert: "You are not authorized to access this page"
    end
  end



end
