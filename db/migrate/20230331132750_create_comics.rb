class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string        :subtitle, null: false
      t.references    :work,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
