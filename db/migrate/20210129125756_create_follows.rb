class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :followee_id, nil: false
      t.integer :follower_id, nil: false

      t.timestamps
    end
  end
end
