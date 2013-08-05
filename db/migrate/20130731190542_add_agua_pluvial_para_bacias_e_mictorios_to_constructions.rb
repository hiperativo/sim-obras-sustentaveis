class AddAguaPluvialParaBaciasEMictoriosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :agua_pluvial_para_bacias_e_mictorios, :boolean
  end
end
