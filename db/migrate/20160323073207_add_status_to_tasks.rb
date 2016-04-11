class AddStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :status,      :string
    add_column :tasks, :report_id,   :integer
    add_column :tasks, :customer_id, :integer
  end
end
