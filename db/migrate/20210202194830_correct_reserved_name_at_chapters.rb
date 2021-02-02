class CorrectReservedNameAtChapters < ActiveRecord::Migration[6.1]
  def change
    remove_column :contents, :order
    add_column :contents, :sequence, :integer
  end
end
