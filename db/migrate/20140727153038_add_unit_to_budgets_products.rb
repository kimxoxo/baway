class AddUnitToBudgetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :unit, :integer
  end

  def down
  	remove_column :budgets_products, :unit, :integer
  end
end
