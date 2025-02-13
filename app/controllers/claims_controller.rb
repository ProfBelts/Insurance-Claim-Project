class ClaimsController < ApplicationController
before_action :set_claim, only: [:approve, :reject]

  def create
    @claim = Claim.new(claim_params)
    
    if @claim.save
      @claim.attachments.create(file: params[:claim][:id_photo], category: "id_photo") if params[:claim][:id_photo].present?
      @claim.attachments.create(file: params[:claim][:proof_of_claim], category: "proof_of_claim") if params[:claim][:proof_of_claim].present?

      redirect_to claim_path, notice: "Claim submitted successfully"
    else
      flash[:alert] = @claim.errors.full_messages.join(", ")
      redirect_to claim_path # Redirect back to the claim form
    end
  end
  
  def approve
    @claim.update(status: "approved", approved_by_id: current_admin.id, processed_at: Time.current)
    head :ok
  end

  def reject
    @claim.update(status: "rejected", approved_by_id: current_admin.id, processed_at: Time.current)
    head :ok
  end
  

  private
  
  def claim_params
    params.require(:claim).permit(:claimable_id, :reason).merge(
      user_id: current_user.id, 
      claimable_type: "Policy", 
      status: "pending"
    )
  end

  def set_claim
    @claim = Claim.find(params[:id])
  end

end
