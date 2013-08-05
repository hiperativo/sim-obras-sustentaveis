class AddMedicaoDeAguaOutrosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :medicao_de_agua_outros, :string
  end
end
