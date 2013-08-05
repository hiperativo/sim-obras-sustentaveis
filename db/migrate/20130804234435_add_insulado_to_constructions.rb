class AddInsuladoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :insulado, :string
  end
end
