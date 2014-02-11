class AddActiveToBudgetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :active, :boolean
  end

  def down
  	remove_column :budgets_products, :active, :boolean
  end
end
