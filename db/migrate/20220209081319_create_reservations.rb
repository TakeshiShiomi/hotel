class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :room_name
      t.string :room_introduction
      t.integer :person
      t.string :room_image
      t.integer :room_charge
      t.integer :room_id

      t.timestamps
    end
  end
end
