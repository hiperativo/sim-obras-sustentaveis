class AddContato1ToConstructions < ActiveRecord::Migration
  def change
    add_column :constructions, :contato1_nome, :string
    add_column :constructions, :contato1_telefone, :string
    add_column :constructions, :contato1_email, :string

    add_column :constructions, :contato2_nome, :string
    add_column :constructions, :contato2_telefone, :string
    add_column :constructions, :contato2_email, :string

    add_column :constructions, :contato3_nome, :string
    add_column :constructions, :contato3_telefone, :string
    add_column :constructions, :contato3_email, :string

    add_column :constructions, :contato4_nome, :string
    add_column :constructions, :contato4_telefone, :string
    add_column :constructions, :contato4_email, :string

    add_column :constructions, :contato5_nome, :string
    add_column :constructions, :contato5_telefone, :string
    add_column :constructions, :contato5_email, :string
  end
end
