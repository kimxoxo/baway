class AddDeletedToBudgets < ActiveRecord::Migration
  def up
  	add_column :budgets, :deleted, :boolean
  end

  def down
  	remove_column :budgets, :deleted, :boolean
  end
end
