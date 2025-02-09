class ClaimsController < ApplicationController
    def create
      @claim = Claim.new(claim_params)
      
      if @claim.save
        redirect_to claim_path, notice: "Claim submitted successfully"
      else
        puts @claim.errors.full_messages  # Log validation errors
        flash[:alert] = @claim.errors.full_messages.join(", ")
        redirect_to claim_path
      end
    end
    
    private
    
    def claim_params
      {
        user_id: current_user.id,   # Ensure claim is linked to a user
        claimable_id: params[:claim][:claimable_id],
        claimable_type: "Policy",   # Explicitly set the claimable type
        status: "pending"           # Default status
      }
    end
  end
  