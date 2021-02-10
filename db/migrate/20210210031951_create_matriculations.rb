class CreateMatriculations < ActiveRecord::Migration[6.1]
  def change
    create_table :matriculations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true
      t.integer :permissions

      t.timestamps
    end
  end
end
