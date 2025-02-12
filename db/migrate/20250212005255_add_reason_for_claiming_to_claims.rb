class AddReasonForClaimingToClaims < ActiveRecord::Migration[7.1]
  def change
    add_column :claims, :reason, :string
  end
end
