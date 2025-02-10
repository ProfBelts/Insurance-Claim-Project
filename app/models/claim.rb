class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :policy, optional: true
  belongs_to :claimable, polymorphic: true
  has_many :attachments, as: :attachable, dependent: :destroy

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :status, inclusion: { in: statuses.keys }
end
