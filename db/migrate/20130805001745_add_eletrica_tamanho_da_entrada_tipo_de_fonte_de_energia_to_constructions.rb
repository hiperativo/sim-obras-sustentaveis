class AddEletricaTamanhoDaEntradaTipoDeFonteDeEnergiaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :eletrica_tamanho_da_entrada_tipo_de_fonte_de_energia, :string
  end
end
