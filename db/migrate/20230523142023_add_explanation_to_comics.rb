class AddExplanationToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :explanation, :text
  end
end
