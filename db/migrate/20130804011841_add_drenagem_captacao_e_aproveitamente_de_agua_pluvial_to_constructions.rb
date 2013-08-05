class AddDrenagemCaptacaoEAproveitamenteDeAguaPluvialToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :drenagem_captacao_e_aproveitamente_de_agua_pluvial, :string
  end
end
