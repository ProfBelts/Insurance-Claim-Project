class AddProcessedAtToClaims < ActiveRecord::Migration[7.1]
  def change
    add_column :claims, :processed_at, :datetime
  end
end
