class AddPossui100DeBackupToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :possui_100_de_backup, :string
  end
end
