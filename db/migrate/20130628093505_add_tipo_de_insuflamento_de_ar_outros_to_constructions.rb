class AddTipoDeInsuflamentoDeArOutrosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :tipo_de_insuflamento_de_ar_outros, :string
  end
end
