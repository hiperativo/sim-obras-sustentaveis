class AddEquipamentosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :equipamentos, :string
  end
end
