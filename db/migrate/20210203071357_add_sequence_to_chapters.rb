class AddSequenceToChapters < ActiveRecord::Migration[6.1]
  def change
    remove_column :chapters, :contents
    add_column :chapters, :sequence, :integer
  end
end
