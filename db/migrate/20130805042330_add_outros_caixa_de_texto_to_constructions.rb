class AddOutrosCaixaDeTextoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :outros_caixa_de_texto, :string
  end
end
