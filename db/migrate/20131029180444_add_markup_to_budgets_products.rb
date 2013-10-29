class AddMarkupToBudgetsProducts < ActiveRecord::Migration
  def change
  	add_column :budgets_products, :markup, :integer
  end
end
