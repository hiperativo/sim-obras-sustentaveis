class ChangeObservacaoToText < ActiveRecord::Migration
  def up
  	change_column :constructions, :ficha_tecnica_observacao, :text
  end

  def down
  end
end
