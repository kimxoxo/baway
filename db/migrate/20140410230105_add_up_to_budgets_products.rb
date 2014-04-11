class AddUpToBudgetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :up, :decimal
  end

  def down
  	remove_column :budgets_products, :up, :decimal
  end
end
