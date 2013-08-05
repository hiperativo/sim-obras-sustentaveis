class AddTorresDeResfriamentoSimToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torres_de_resfriamento_sim, :string
  end
end
