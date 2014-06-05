class AddDeletedToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :deleted, :boolean
  end

  def down
  	remove_column :users, :deleted, :boolean
  end
end
