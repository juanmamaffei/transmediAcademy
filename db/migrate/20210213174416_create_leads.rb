class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :user
      t.string :status
      t.string :course
      t.string :name
      t.string :email
      t.string :info

      t.timestamps
    end
  end
end
