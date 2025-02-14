class Claim < ApplicationRecord
  before_create :generate_transaction_number

  belongs_to :user
  belongs_to :admin, optional: true, foreign_key: "approved_by_id"
  belongs_to :policy, optional: true
  belongs_to :claimable, polymorphic: true
  has_many :attachments, as: :attachable, dependent: :destroy
  
  

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validate :claimable_presence
  # validate :must_have_required_attachments

  validates :status, inclusion: { in: statuses.keys }
  validates :reason, presence: {message: "field should not be empty"}, length: { minimum: 5, maximum: 500 }
  


  
  private


  # Custom Validations
  def claimable_presence  # ✅ Make sure this method is present
  if claimable_id.blank?
      errors.add(:base, "Please Select a Policy Type and Coverage")
    end
  end


  def must_have_required_attachments
    required_categories = ["id_photo", "proof_of_claim"]
    uploaded_categories = attachments.pluck(:category)  # Get all uploaded categories

    missing_categories = required_categories - uploaded_categories  # Check which ones are missing

    if missing_categories.present?
      errors.add(:base, "Please upload the required documents")
    end
  end



  def generate_transaction_number
    loop do
      self.transaction_number = "TXN#{Time.current.strftime('%Y%m%d%H%M%S')}#{SecureRandom.hex(2).upcase}"
      break unless Claim.exists?(transaction_number: transaction_number)
    end
  end

  def set_processed_at
    if status_changed? && (status == "approved" || status == "rejected")
      self.processed_at = Time.current
    end
  end

end
