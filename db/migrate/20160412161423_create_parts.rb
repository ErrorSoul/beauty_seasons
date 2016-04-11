class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :asset
      t.string :mini_asset
      t.string :link
      t.text :content

      t.timestamps null: false
    end
  end
end
