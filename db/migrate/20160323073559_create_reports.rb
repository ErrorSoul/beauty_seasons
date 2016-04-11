class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :asset
      t.integer :current_id

      t.timestamps null: false
    end
  end
end
