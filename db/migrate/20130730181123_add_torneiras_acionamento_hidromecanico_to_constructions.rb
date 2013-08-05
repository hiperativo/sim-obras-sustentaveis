class AddTorneirasAcionamentoHidromecanicoToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :torneiras_acionamento_hidromecanico, :boolean
  end
end
