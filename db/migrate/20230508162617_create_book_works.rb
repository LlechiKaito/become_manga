class CreateBookWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :book_works do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true
      t.timestamps
    end
  end
end
