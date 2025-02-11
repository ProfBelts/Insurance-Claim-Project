class AddTransactionNumberToClaims < ActiveRecord::Migration[7.1]
  def change
    add_column :claims, :transaction_number, :string
  end
end
