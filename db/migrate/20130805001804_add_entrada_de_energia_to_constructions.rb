class AddEntradaDeEnergiaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :entrada_de_energia, :string
  end
end
