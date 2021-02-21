class AddStateToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :user_contents, :aasm_state, :string
    add_column :contents, :aasm_state, :string
    add_column :chapters, :aasm_state, :string
    add_column :courses, :aasm_state, :string
  end

end
