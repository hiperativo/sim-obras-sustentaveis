class AddTeveConsultoriaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :teve_consultoria, :boolean
  end
end
