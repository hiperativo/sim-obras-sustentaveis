class AddConstrutoraRazaoSocialtoConstructions < ActiveRecord::Migration
  def up
  	add_column :constructions, :construtora1_razao_social, :string
  	add_column :constructions, :construtora2_razao_social, :string
  	add_column :constructions, :construtora3_razao_social, :string
  	add_column :constructions, :construtora4_razao_social, :string
  end

  def down
  end
end
