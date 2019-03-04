class CreatePersonSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :person_slots do |t|
      t.references :person, foreign_key: true, null: false
      t.references :slot, foreign_key: true, null: false
      t.boolean :open, null: false, default: true

      t.timestamps
    end
    add_index :person_slots, :open
  end
end
