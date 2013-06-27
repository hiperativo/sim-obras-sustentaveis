class ChangeDataTypesFromConstructions < ActiveRecord::Migration
  def up
	change_column :constructions, :inicio_da_obra, :text
	change_column :constructions, :termino_da_obra, :text
  end

  def down
  end
end
