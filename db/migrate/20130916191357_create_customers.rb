class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :street
      t.integer :street_number
      t.string :tax_number
      t.string :neighbourhood
      t.string :postal_code
      t.string :address_complement
      t.integer :tax_number_type
      t.string :landline
      t.string :mobile
      t.string :city
      t.string :rg

      t.timestamps
    end
  end
end
