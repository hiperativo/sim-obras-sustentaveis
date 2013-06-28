class AddTeveConsultoriaQualEmpresaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :teve_consultoria_qual_empresa, :string
  end
end
