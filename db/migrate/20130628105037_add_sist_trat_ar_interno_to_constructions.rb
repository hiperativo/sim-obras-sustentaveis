class AddSistTratArInternoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :sist_trat_ar_interno, :string
  end
end
