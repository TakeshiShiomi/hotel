class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.integer :charge
      t.string :address
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
