class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :remember_token
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
