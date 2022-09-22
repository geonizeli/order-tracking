class AddPublicIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :public_id, :string
    add_index :orders, :public_id, unique: true
  end
end
