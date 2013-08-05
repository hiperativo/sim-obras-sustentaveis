class AddArCondicionadoCondensacaoOutrosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :ar_condicionado_condensacao_outros, :string
  end
end
