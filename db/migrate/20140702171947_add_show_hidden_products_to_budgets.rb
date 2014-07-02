class AddShowHiddenProductsToBudgets < ActiveRecord::Migration
  def up
  	add_column :budgets, :show_hidden_products, :boolean
  end

  def down
  	remove_column :budgets, :show_hidden_products, :boolean
  end
end
