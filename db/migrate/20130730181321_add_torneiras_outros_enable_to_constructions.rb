class AddTorneirasOutrosEnableToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torneiras_outros_enable, :boolean
  end
end
