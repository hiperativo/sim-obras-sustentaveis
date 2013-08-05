class AddColumnsToConstructions < ActiveRecord::Migration
	def change
		add_column :constructions, :contato1_razao_social, :string
		add_column :constructions, :contato2_razao_social, :string
		add_column :constructions, :contato3_razao_social, :string
		add_column :constructions, :contato4_razao_social, :string
		add_column :constructions, :contato5_razao_social, :string
		add_column :constructions, :contato1_funcao, :string
		add_column :constructions, :contato2_funcao, :string
		add_column :constructions, :contato3_funcao, :string
		add_column :constructions, :contato4_funcao, :string
		add_column :constructions, :contato5_funcao, :string
		add_column :constructions, :numero_de_unidades, :string
	end
end