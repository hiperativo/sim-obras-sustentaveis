class AddPerfilNivelDeCertificacaoEnableCategoriaN1RelacaoDoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :perfil_nivel_de_certificacao_enable_categoria_n_1_relacao_do_, :string
  end
end
