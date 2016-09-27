class CreateNukes < ActiveRecord::Migration[5.0]
  def change
    create_table :nukes do |t|
      t.integer :user_id
      t.integer :x
      t.integer :y
      t.string :status
      t.string :sunk

      t.timestamps
    end
  end
end
