class AddMedicaoSetorizadaDeConsumosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :medicao_setorizada_de_consumos, :string
  end
end
