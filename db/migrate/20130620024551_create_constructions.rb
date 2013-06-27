class CreateConstructions < ActiveRecord::Migration
  def change
    create_table :constructions do |t|

      t.timestamps
    end
  end
end
