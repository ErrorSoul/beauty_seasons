class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :fio
      t.string :email
      t.string :phone
      t.string :link

      t.timestamps null: false
    end
  end
end
