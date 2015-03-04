class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :email
      t.string :street
      t.string :street_number
      t.string :neighbourhood
      t.string :city
      t.string :address_complement
      t.string :cnpj
      t.string :postal_code
      t.string :landline
      t.string :mobile
      t.string :ie

      t.timestamps
    end
  end
end
