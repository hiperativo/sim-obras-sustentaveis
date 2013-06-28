class AddComoEstaReduzindoIlhasDeCalorAltaRefletanciaSolarCorBrancaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :como_esta_reduzindo_ilhas_de_calor_alta_refletancia, :string
  end
end
