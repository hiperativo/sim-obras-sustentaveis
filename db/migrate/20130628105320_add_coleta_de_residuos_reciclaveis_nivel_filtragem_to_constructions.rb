class AddColetaDeResiduosReciclaveisNivelFiltragemToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :coleta_de_residuos_reciclaveis_nivel_filtragem, :string
  end
end
