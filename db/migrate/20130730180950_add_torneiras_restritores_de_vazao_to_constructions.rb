class AddTorneirasRestritoresDeVazaoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torneiras_restritores_de_vazao, :boolean
  end
end
