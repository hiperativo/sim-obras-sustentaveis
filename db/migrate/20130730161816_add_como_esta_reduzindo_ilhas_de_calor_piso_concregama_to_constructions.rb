class AddComoEstaReduzindoIlhasDeCalorPisoConcregamaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :como_esta_reduzindo_ilhas_de_calor_piso_concregama, :boolean
  end
end
