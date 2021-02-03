class AddEmbededFieldToContent < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :embed, :text
  end
end
