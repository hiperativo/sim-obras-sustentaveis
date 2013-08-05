class AddTratamentoDeArExternoControleDeDemandaDeVentilacaoPorToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :tratamento_de_ar_externo_controle_de_demanda_de_ventilacao_por_, :string
  end
end
