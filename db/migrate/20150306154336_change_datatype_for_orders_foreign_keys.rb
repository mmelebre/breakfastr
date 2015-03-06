class ChangeDatatypeForOrdersForeignKeys < ActiveRecord::Migration
  def change
  	change_column :orders, :user_id, :integer
  	change_column :orders, :pastry_id, :integer 

  end
end
