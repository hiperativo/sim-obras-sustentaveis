class AddArCondicionadoCondensacaoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :ar_condicionado_condensacao, :string
  end
end
