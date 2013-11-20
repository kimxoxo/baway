# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  supplier_id    :string(255)
#  description    :text
#  brand          :string(255)
#  code           :string(255)
#  supplier_price :decimal(, )
#  ipi            :decimal(, )
#  ncm            :integer
#  width          :decimal(, )
#  um             :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Product < ActiveRecord::Base


  attr_accessible :brand, :code, :description, :ipi, :ncm, :supplier_id, :supplier_price, :um, :width


	attr_accessor :search_phrase, :budget_id


  #this is similar to has_and_belongs_to_many
  #this way we can use extra attributes in the budgets_products
  has_many :budgets_products
  has_many :budgets, through: :budgets_products

  belongs_to :supplier


  validates :code, :description, :ipi, :supplier_id, :supplier_price, :um, :width,
      presence: true


	validates :supplier_price, numericality: { greater_than: 0 }


	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      product_hash = row.to_hash # exclude the price field
      product = Product.find_by_code(row["code"])


      #format price
      kim = product_hash["supplier_price"].gsub(/[^0-9,]/, '')
      kim1 = kim.gsub(',', '.')


      product_hash["description"] = kim
product_hash["supplier_price"] = kim1


      if product
        product.update_attributes!(product_hash)
      else
        Product.create!(product_hash)
      end
    end
  end




end