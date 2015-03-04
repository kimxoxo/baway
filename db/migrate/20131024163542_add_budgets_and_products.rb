class AddBudgetsAndProducts < ActiveRecord::Migration
  def up
    create_table :budgets_products do |t|
      t.references :budget, :product
      t.string :house_area
      t.integer :quantity
      t.integer :days_to_delivery
      t.decimal :freight
      t.decimal :height
      t.decimal :width
      t.boolean :active
      t.integer :request_id
      t.decimal :computed_price
      t.string :product_observations
    end
  end

  def down
    drop_table :budgets_products
  end
end
