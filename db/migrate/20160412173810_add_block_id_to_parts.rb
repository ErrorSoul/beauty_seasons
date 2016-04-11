class AddBlockIdToParts < ActiveRecord::Migration
  def change
    add_column :parts, :block_id, :integer
  end
end
