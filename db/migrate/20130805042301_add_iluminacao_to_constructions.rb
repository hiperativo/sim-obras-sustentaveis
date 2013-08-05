class AddIluminacaoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :iluminacao, :string
  end
end
