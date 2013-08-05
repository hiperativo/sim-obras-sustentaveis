class AddArCondicionadoCondensacaoBomToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :ar_condicionado_condensacao_bom, :string
  end
end
