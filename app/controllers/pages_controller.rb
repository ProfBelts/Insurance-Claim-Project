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

  



end
