class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :asset

      t.timestamps null: false
    end
  end
end
