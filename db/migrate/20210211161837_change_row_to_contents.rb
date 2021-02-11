class ChangeRowToContents < ActiveRecord::Migration[6.1]
  def change
    remove_column :contents, :requirements
    add_column :contents, :requirements, :integer
  end
end
