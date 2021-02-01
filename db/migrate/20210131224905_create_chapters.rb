class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :description
      t.integer :goals, array: true, default: []
      t.belongs_to :course, null: false, foreign_key: true
      t.integer :contents, array: true, default: []

      t.timestamps
    end
  end
end
