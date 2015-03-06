class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :stripe_token
      t.string :user_id
      t.string :pastry_id

      t.timestamps null: false
    end
  end
end
