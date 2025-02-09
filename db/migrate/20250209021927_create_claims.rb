class CreateClaims < ActiveRecord::Migration[7.1]
  def change
    create_table :claims do |t|
      t.references :user, null: false, foreign_key: true
      t.references :claimable, polymorphic: true, null: false
      t.integer :status

      t.timestamps
    end
  end
end
