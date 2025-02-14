class Claim < ApplicationRecord
  before_create :generate_transaction_number

  belongs_to :user
  belongs_to :admin, optional: true, foreign_key: "approved_by_id"
  belongs_to :policy, optional: true
  belongs_to :claimable, polymorphic: true
  has_many :attachments, as: :attachable, dependent: :destroy
  
  

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :status, inclusion: { in: statuses.keys }
  
  private

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
