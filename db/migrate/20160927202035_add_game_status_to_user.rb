class AddGameStatusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :game_status, :integer
  end
end
