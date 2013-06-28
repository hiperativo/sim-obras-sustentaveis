class AddColetaDeResiduosReciclaveisSistemaTratArInternoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :coleta_de_residuos_reciclaveis_sistema_trat_ar_interno, :string
  end
end
