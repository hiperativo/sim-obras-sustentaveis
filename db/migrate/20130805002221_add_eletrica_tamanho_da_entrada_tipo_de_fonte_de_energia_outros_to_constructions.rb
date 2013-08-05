class AddEletricaTamanhoDaEntradaTipoDeFonteDeEnergiaOutrosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :eletrica_tamanho_da_entrada_tipo_de_fonte_de_energia_outros, :string
  end
end
