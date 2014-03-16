class AddVisibleToProducts < ActiveRecord::Migration
  def up
  	add_column :products, :visible, :boolean
  end

  def down
  	remove_column :products, :visible, :boolean
  end
end
