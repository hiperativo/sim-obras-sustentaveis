class ChangeColumnType < ActiveRecord::Migration
  def up
	remove_column :constructions, :inicio_da_obra
	remove_column :constructions, :termino_da_obra
	add_column :constructions, :inicio_da_obra, :date
	add_column :constructions, :termino_da_obra, :date
  end

  def down
  end
end
