class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.text :inquiry, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
      end
  end
end