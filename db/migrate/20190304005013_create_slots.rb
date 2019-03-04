class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.datetime :date_time, null: false

      t.timestamps
    end
    add_index :slots, :date_time
  end
end
