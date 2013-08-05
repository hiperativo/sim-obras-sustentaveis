class AddMedicaoDeEnergiaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :medicao_de_energia, :string
  end
end
