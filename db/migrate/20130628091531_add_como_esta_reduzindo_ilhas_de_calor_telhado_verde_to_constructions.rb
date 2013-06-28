class AddComoEstaReduzindoIlhasDeCalorTelhadoVerdeToConstructions < ActiveRecord::Migration
  def change
    remove_column :constructions, :como_esta_reduzindo_ilhas_de_calor_alta_refletancia
    add_column :constructions, :como_esta_reduzindo_ilhas_de_calor_alta_refletancia, :boolean
    add_column :constructions, :como_esta_reduzindo_ilhas_de_calor_telhado_verde, :boolean
  end
end
