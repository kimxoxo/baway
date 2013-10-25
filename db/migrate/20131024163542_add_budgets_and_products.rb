class AddBudgetsAndProducts < ActiveRecord::Migration
  def up
    create_table :budgets_products do |t|
      t.references :budget, :product
    end
  end

  def down
    drop_table :budgets_products
  end
end
