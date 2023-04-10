class RenameEmailToEmailAddressInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :works, :category, :category_id
  end
end
