class AddArCondicionadoCondensacaoVrfToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :ar_condicionado_condensacao_vrf, :string
  end
end
