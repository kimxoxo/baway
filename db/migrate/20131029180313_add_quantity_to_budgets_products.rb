class AddQuantityToBudgetsProducts < ActiveRecord::Migration
  def change
  	add_column :budgets_products, :quantity, :integer
  end
end
