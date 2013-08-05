class AddComoEstaReduzindoIlhasDeCalorVagasCobertasToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :como_esta_reduzindo_ilhas_de_calor_vagas_cobertas, :boolean
  end
end
