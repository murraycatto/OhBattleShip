class CreateShipsSunks < ActiveRecord::Migration[5.0]
  def change
    create_table :ships_sunks do |t|
      t.integer :user_id
      t.integer :ship_id

      t.timestamps
    end
  end
end
