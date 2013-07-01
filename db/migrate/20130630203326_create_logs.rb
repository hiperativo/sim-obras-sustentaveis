class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :admin_id
      t.string :action
      t.string :details

      t.timestamps
    end
  end
end
