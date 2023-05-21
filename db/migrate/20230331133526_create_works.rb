class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string      :main_title,  null: false
      t.text        :explanation, null: false
      t.integer     :category,    null: false
      t.references  :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
  