class AddMarkupToBudgets < ActiveRecord::Migration
  def change
  	add_column :budgets, :markup, :float
  end
end
