class AddLowEBaixaEmissividadeToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :low_e_baixa_emissividade, :string
  end
end
