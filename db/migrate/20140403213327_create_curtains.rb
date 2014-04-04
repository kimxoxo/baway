class CreateCurtains < ActiveRecord::Migration
  def change
    create_table :curtains do |t|
    	t.integer :budgets_product_id
      t.decimal :window_width
      t.decimal :window_height
      t.integer :window_number_parts
      t.integer :wave_factor
      t.decimal :fabric_width

      t.timestamps
    end
  end
end