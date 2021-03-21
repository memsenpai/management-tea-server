class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id, nil: false
      t.string :name
      t.integer :price_buy
      t.integer :price_sell

      t.timestamps
    end
  end
end
