class AddArCondicionadoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :ar_condicionado, :string
  end
end
