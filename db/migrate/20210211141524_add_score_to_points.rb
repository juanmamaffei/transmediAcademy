class AddScoreToPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :points, :score, :integer
  end
end
