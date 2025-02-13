class User < ApplicationRecord

  has_many :attachments, as: :attachable

  # enum gender: { Male: 1, Female: 2 }
  # Devise Modules (if using Devise)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Validations
  validates :name, presence: true, length: { maximum: 100 }
  validates :gender, inclusion: { in: [1, 2], message: "must be 1 (Male) or 2 (Female)" }

end
