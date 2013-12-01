class AddBudgetsAndProducts < ActiveRecord::Migration
  def up
    create_table :budgets_products do |t|
      t.references :budget, :product
      t.string :house_area
      t.integer :quantity
      t.integer :days_to_delivery
      t.decimal :freight
    end
  end

  def down
    drop_table :budgets_products
  end
end
