class AddTorneirasOutrosToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torneiras_outros, :string
  end
end
