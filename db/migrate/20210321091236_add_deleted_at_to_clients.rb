class AddDeletedAtToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :deleted_at, :datetime
    add_index :orders, :deleted_at
    add_column :items, :deleted_at, :datetime
    add_index :items, :deleted_at
    add_column :order_items, :deleted_at, :datetime
    add_index :order_items, :deleted_at
  end
end
