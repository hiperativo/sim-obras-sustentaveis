class CorrectEnergiaSolarFotovoltaica < ActiveRecord::Migration
  def up
  	rename_column :constructions, :energia_alternativa_solar_fotovaltaica, :energia_alternativa_solar_fotovoltaica
  end

  def down
  end
end
