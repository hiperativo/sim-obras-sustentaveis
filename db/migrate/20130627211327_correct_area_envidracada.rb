class CorrectAreaEnvidracada < ActiveRecord::Migration
  def up
    rename_column :constructions, :vidros_area_envidraçada_da_fachada, :vidros_area_envidracada_da_fachada
    rename_column :constructions, :vidros_area_envidraçada_da_fachada_porcentagem, :vidros_area_envidracada_da_fachada_porcentagem
 end

  def down
  end
end
