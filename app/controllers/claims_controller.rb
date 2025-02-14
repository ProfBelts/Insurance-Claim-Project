class ClaimsController < ApplicationController
before_action :set_claim, only: [:approve, :reject]

def create
  @claim = Claim.new(claim_params)

  # Check if required files are present before saving the claim
  if params[:claim][:id_photo].blank? || params[:claim][:proof_of_claim].blank?
    flash[:alert] = "Please upload the required documents"
    return redirect_to claim_path
  end

  if @claim.save
    # Attach files after claim is saved
    @claim.attachments.create(file: params[:claim][:id_photo], category: "id_photo") if params[:claim][:id_photo].present?
    @claim.attachments.create(file: params[:claim][:proof_of_claim], category: "proof_of_claim") if params[:claim][:proof_of_claim].present?

    redirect_to transactions_path, flash: { notice: "Claim submitted successfully" }
  else
    flash[:alert] = @claim.errors.full_messages.join(", ")
    redirect_to claim_path
  end
end

  
  def approve
    @claim.update(status: "approved", approved_by_id: current_admin.id, processed_at: Time.current)
    flash[:notice] = "Claim approved successfully"
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
