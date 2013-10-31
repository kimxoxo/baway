class AddMarkupToBudgetsProducts < ActiveRecord::Migration
  def change
  	add_column :budgets_products, :markup, :float
  end
end
