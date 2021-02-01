class ChangeColumnNameToContents < ActiveRecord::Migration[6.1]
  def change
    remove_column :contents, :type
    add_column :contents, :typeOfContent, :integer
  end
end
