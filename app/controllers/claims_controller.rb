class ClaimsController < ApplicationController
  def create
    @claim = Claim.new(claim_params)
    
    if @claim.save
      @claim.attachments.create(file: params[:claim][:id_photo], category: "id_photo") if params[:claim][:id_photo].present?
      @claim.attachments.create(file: params[:claim][:proof_of_claim], category: "proof_of_claim") if params[:claim][:proof_of_claim].present?

      redirect_to @claim, notice: "Claim submitted successfully"
    else
      flash[:alert] = @claim.errors.full_messages.join(", ")
      redirect_to new_claim_path # Redirect back to the claim form
    end
  end
  
  private
  
  def claim_params
    params.require(:claim).permit(:claimable_id, :reason_for_claim).merge(
      user_id: current_user.id, 
      claimable_type: "Policy", 
      status: "pending"
    )
  end
end
