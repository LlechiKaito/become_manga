class AddTitleEvaluationToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :evaluation, :integer
  end
end
