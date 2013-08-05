class AddTorneirasSensorDePresencaToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torneiras_sensor_de_presenca, :boolean
  end
end
