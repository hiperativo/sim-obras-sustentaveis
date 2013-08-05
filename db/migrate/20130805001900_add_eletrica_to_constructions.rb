class AddEletricaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :eletrica, :string
  end
end
