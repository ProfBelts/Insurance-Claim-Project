class AddPolicyTypeToPolicies < ActiveRecord::Migration[7.1]
  def change
    add_column :policies, :policy_type, :string
  end
end
