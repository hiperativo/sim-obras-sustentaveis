class RemoveCodigoObraFromConstructions < ActiveRecord::Migration
  def change
    remove_column :constructions, :codigo_obra, :string
  end
end
