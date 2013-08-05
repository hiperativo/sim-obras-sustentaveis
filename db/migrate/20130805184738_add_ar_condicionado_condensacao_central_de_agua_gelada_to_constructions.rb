class AddArCondicionadoCondensacaoCentralDeAguaGeladaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :ar_condicionado_condensacao_central_de_agua_gelada, :string
  end
end
