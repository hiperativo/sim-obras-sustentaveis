class AddInfoToAdmin < ActiveRecord::Migration
  def change
  	change_table :admins do |t|
  		t.string :name
  	end
  end
end
