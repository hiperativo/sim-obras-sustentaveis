class AddPerfilNivelDeCertificacaoOutros < ActiveRecord::Migration
  def change
  	add_column :constructions, :perfil_nivel_de_certificacao_outros, :string
  end
end
