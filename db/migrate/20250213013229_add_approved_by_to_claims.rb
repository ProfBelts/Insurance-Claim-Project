class AddApprovedByToClaims < ActiveRecord::Migration[7.1]
  def change
    add_reference :claims, :approved_by, foreign_key: { to_table: :admins }
  end
end
