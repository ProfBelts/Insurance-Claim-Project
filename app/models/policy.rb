class Policy < ApplicationRecord
    before_validation :generate_policy_number, on: :create
  
    validates :name, presence: true
    validates :policy_number, uniqueness: true
  
    private
  
    def generate_policy_number
      return if policy_number.present?
  
      prefix = case name.downcase
               when /health/ then "HLT"
               when /auto/ then "AUTO"
               when /property/ then "PROP"
               else "GEN"
               end
  
      loop do
        self.policy_number = "#{prefix}-#{SecureRandom.hex(4).upcase}"
        break unless Policy.exists?(policy_number: policy_number)
      end
    end
  end
  