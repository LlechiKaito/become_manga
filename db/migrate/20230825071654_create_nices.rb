class CreateNices < ActiveRecord::Migration[6.0]
  def change
    create_table :nices do |t|
      t.references    :user,     null: false, foreign_key: true
      t.references    :comic,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
