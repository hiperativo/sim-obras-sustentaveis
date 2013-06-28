class AddAguaCondensacaoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :agua_condensacao, :boolean
  end
end
