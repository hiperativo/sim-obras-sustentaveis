class AddVidrosAreaEnvidracadaOutrosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :vidros_area_envidracada_outros, :string
  end
end
