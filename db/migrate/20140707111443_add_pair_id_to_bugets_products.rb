class AddPairIdToBugetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :pair_id, :integer
  end

  def down
  	remove_column :budgets_products, :pair_id, :integer
  end
end
