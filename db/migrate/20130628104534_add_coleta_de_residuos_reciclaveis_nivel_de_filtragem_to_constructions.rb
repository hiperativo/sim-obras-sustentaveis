class AddColetaDeResiduosReciclaveisNivelDeFiltragemToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :coleta_de_residuos_reciclaveis_nivel_de_filtragem, :boolean
  end
end
