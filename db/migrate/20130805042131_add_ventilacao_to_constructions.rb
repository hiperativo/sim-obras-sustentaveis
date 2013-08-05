class AddVentilacaoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :ventilacao, :string
  end
end
