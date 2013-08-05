class AddGasToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :gas, :string
  end
end
