class CreateNewModelNames < ActiveRecord::Migration[6.0]
  def change
    rename_table :book_works, :book_marks
  end
end
