class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :price
      t.string :goals
      t.integer :duration
      t.text :evaluation
      t.boolean :visibility

      t.timestamps
    end
  end
end
