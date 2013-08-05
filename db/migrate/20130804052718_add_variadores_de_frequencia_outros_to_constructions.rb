class AddVariadoresDeFrequenciaOutrosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :variadores_de_frequencia_outros, :string
  end
end
