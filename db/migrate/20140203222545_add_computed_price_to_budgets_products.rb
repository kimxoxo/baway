class AddComputedPriceToBudgetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :computed_price, :decimal
  	add_column :budgets_products, :product_observations, :string
  end

  def down
  	remove_column :budgets_products, :computed_price, :decimal
  	remove_column :budgets_products, :product_observations, :string
  end
end
