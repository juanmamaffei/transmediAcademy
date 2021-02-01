class AddChapterToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :chapters, :integer, array:true, default: []
  end
end
