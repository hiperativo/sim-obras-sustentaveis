class AddTorresDeResfriamentoTipoEspecificoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torres_de_resfriamento_tipo_especifico, :string
  end
end
