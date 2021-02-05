class CorrectColumnNameReservedFromUserContents < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_contents, :type
    add_column :user_contents, :content_type, :integer
  end
end
