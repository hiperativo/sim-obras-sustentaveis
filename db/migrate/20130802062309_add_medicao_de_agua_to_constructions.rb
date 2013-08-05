class AddMedicaoDeAguaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :medicao_de_agua, :string
  end
end
