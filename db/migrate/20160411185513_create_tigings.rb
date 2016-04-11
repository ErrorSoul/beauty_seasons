class CreateTigings < ActiveRecord::Migration
  def change
    create_table :tigings do |t|
      t.text :text
      t.string :asset
      t.string :title

      t.timestamps null: false
    end
  end
end
