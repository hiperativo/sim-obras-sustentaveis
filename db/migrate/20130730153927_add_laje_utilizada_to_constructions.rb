class AddLajeUtilizadaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :laje_utilizada, :string
  end
end
