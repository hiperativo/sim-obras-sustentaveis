class AddAguaDeCondensacaoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :agua_de_condensacao, :boolean
  end
end
