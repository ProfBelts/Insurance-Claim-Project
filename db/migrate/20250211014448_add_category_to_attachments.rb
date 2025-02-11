class AddCategoryToAttachments < ActiveRecord::Migration[7.1]
  def change
    add_column :attachments, :category, :string
  end
end
