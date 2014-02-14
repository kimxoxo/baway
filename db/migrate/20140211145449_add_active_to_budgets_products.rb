class AddActiveToBudgetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :active, :boolean
  	add_column :budgets_products, :request_id, :integer 	
  end

  def down
  	remove_column :budgets_products, :active, :boolean
  	remove_column :budgets_products, :request_id, :integer
  end
end