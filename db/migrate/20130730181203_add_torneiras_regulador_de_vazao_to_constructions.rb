class AddTorneirasReguladorDeVazaoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torneiras_regulador_de_vazao, :boolean
  end
end
