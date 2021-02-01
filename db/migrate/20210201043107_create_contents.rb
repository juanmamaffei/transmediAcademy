class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :chapter, null: false, foreign_key: true
      t.string :name
      t.integer :order
      t.integer :type
      t.text :richContent
      t.integer :priority
      t.integer :testId
      t.integer :requirements, array: true, default: []
      t.integer :minimumScore
      t.string :goals, array: true, default: []

      t.timestamps
    end
  end
end
