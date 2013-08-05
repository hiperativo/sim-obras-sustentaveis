class AddElevadoresToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :elevadores, :string
  end
end
