class AddShowToBudgetsProducts < ActiveRecord::Migration
  def up
  	add_column :budgets_products, :show, :boolean
  end

  def down
  	remove_column :budgets_products, :show, :boolean
  end
end