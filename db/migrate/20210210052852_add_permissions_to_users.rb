class AddPermissionsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :permissions, :integer
  end
end
