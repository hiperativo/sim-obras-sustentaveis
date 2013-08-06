class AddDadosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :dados, :text
  end
end
