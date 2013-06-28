class AddComoEstaReduzindoIlhasDeCalorToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :como_esta_reduzindo_ilhas_de_calor, :string
  end
end
