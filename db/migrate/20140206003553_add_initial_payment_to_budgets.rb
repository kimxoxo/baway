class AddInitialPaymentToBudgets < ActiveRecord::Migration
  def up
  	add_column :budgets, :initial_payment, :decimal
  end

  def down
  	remove_column :budgets, :initial_payment, :decimal
  end
end
