class ChangeSomeFieldsToBoolean < ActiveRecord::Migration
  def up
    remove_column :constructions, :tratamento_de_ar_externo_roda_entalpica
    remove_column :constructions, :tratamento_de_ar_externo_trocador_de_calor
    add_column :constructions, :tratamento_de_ar_externo_roda_entalpica, :boolean
    add_column :constructions, :tratamento_de_ar_externo_trocador_de_calor, :boolean
  end

  def down
  end
end
