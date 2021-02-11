class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :question
      t.string :a1
      t.string :a2
      t.string :a3
      t.string :a4
      t.integer :correct
      t.belongs_to :content, null: false, foreign_key: true
      t.integer :score
      t.string :difficulty
      t.string :state

      t.timestamps
    end
  end
end
