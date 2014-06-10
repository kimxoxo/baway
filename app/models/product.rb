# == Schema Information
#
# Table name: products
#
#  id                      :integer          not null, primary key
#  supplier_id             :integer
#  description             :text
#  brand                   :string(255)
#  code                    :string(255)
#  supplier_price          :decimal(, )
#  ipi                     :decimal(, )
#  ncm                     :integer
#  width                   :decimal(, )
#  product_type            :integer
#  markup                  :decimal(, )
#  supplier_table_discount :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  visible                 :boolean
#

class Product < ActiveRecord::Base

	#get access to helper
	extend ProductsHelper


  attr_accessible :brand, :code, :description, :ipi, :ncm,
  								:supplier_id, :supplier_price, :width, :product_type, :markup,
  								:supplier_table_discount, :visible, :search_phrase


	attr_accessor :search_phrase, :budget_id


  #this is similar to has_and_belongs_to_many
  #this way we can use extra attributes in the budgets_products
  has_many :budgets_products
  has_many :budgets, through: :budgets_products

  belongs_to :supplier


  validates :code, :description, :ipi, :supplier_id, :supplier_price, :width, :product_type,
      presence: true


	validates :supplier_price, numericality: { greater_than: 0 }





	def self.import(file)

	  i = 0

    CSV.foreach(file.path, headers: true) do |row|

      product_hash = row.to_hash
    
      code_from_cell = product_hash["code"].strip
      supplier_id_from_cell = product_hash["supplier_id"].strip


      #make all products visible = false first, then visible the updated products and new products
    	i = i + 1
    	
    	if i == 1
    		@products = Product.find_all_by_supplier_id(supplier_id_from_cell.to_i)
    		@products.each do |p|
    			p.update_attributes(visible: false)
    		end
    	end


      @product = Product.where(code: "#{code_from_cell}", supplier_id: supplier_id_from_cell.to_i).first

      if @product

      	@product.code        = product_hash["code"].strip
      	@product.supplier_id = product_hash["supplier_id"].strip
      	@product.markup      = string_to_float(product_hash["markup"].strip)
      	@product.supplier_price = string_to_float(product_hash["supplier_price"].strip)
      	@product.ipi            = string_to_float(product_hash["ipi"].strip)
      	@product.width          = string_to_float(product_hash["width"].strip)
      	@product.supplier_table_discount = string_to_float(product_hash["supplier_table_discount"].strip)
      	@product.description             = product_hash["description"].strip
      	@product.product_type            = product_hash["product_type"].strip
      	@product.updated_at							 = Date.today
      	@product.visible								 = true

      	@product.save!

      else

      	@product = Product.new()

      	@product.code        = product_hash["code"].strip
      	@product.supplier_id = product_hash["supplier_id"].strip
      	@product.markup      = string_to_float(product_hash["markup"].strip)
      	@product.supplier_price = string_to_float(product_hash["supplier_price"].strip)
      	@product.ipi            = string_to_float(product_hash["ipi"].strip)
      	@product.width          = string_to_float(product_hash["width"].strip)
      	@product.supplier_table_discount = string_to_float(product_hash["supplier_table_discount"].strip)
      	@product.description             = product_hash["description"].strip
      	@product.product_type            = product_hash["product_type"].strip
      	@product.updated_at							 = Date.today
      	@product.visible								 = true

      	@product.save!

      end

      #if the query returns more than one product then the update_attributes will return an error
      #undefined method `update_attributes!' for #<ActiveRecord::Relation:0x000001048c6860>
      #which means there are two or more items for the same supplier_id with the same code
    end

	  #@products = Product.where(supplier_id: @product.supplier_id)

	  #@products.each do |product|
	  	#if product.updated_at.strftime("%Y%m%d") != Date.today.strftime("%Y%m%d")
	  		#product.visible = false
	  		#product.save
	  	#end
	  #end
  end




end
