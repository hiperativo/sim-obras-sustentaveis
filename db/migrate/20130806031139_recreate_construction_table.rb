class RecreateConstructionTable < ActiveRecord::Migration
  def change
  	drop_table :constructions
  	create_table :constructions
  	add_column :constructions, :dados, :text
  end
end
