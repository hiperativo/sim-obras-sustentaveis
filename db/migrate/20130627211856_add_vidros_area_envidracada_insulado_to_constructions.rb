class AddVidrosAreaEnvidracadaInsuladoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :vidros_area_envidracada_insulado, :boolean
  end
end
