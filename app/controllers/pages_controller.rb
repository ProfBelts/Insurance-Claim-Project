class PagesController < ApplicationController
  def home
    reset_session
  end

  def claim 
    @claim = Claim.new
  end

end
