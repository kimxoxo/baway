class AddProductTypeToBudgetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :product_type, :integer
  end

  def down
  	remove_column :budgets_products, :product_type, :integer
  end
end
