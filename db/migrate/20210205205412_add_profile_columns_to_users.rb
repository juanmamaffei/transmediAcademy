class AddProfileColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :about, :string
  end

  def up
    add_attachment :users, :avatar
  end
 
  def down
    remove_attachment :users, :avatar
  end
end
