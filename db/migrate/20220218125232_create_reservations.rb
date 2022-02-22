class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start
      t.datetime :end
      t.integer :room_id
      t.string :room_name
      t.integer :room_charge
      t.integer :room_introduction
      t.string :room_image
      t.integer :person

      t.timestamps
    end
  end
end
