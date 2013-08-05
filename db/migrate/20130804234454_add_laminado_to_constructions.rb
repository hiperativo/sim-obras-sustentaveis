class AddLaminadoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :laminado, :string
  end
end
