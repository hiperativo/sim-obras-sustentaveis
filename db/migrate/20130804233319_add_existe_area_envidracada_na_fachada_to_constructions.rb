class AddExisteAreaEnvidracadaNaFachadaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :existe_area_envidracada_na_fachada, :string
  end
end
