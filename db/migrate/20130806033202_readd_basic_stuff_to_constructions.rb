class ReaddBasicStuffToConstructions < ActiveRecord::Migration
  def change
	add_column :constructions, :created_at, :datetime, null: false, default: Time.now
	add_column :constructions, :updated_at, :datetime, null: false, default: Time.now
  end
end
