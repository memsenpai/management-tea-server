# frozen_string_literal: true
class CreateSleeps < ActiveRecord::Migration[5.2]
  def change
    create_table :sleeps do |t|
      t.integer :user_id, nil: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
