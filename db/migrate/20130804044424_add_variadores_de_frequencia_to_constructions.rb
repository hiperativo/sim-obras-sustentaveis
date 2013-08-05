class AddVariadoresDeFrequenciaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :variadores_de_frequencia, :string
  end
end
