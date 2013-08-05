class AddPeakShavingToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :peak_shaving, :string
  end
end
