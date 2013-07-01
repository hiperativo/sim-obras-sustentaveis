class AddDefaultRoleToAdmins < ActiveRecord::Migration
  def change
  	remove_column :admins, :role
  	add_column :admins, :role, :string, default: "pesquisador"
  end
end
