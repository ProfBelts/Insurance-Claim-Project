class CreatePolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :policies do |t|
      t.string :name
      t.text :description
      t.string :policy_number

      t.timestamps
    end
    add_index :policies, :policy_number, unique: true
  end
end
