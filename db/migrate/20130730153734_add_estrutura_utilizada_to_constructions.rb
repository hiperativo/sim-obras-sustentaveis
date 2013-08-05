class AddEstruturaUtilizadaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :estrutura_utilizada, :string
  end
end
