class AddMobileToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :mobile, :string
  end

  def down
  	remove_column :users, :mobile, :string
  end
end
