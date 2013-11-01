module BudgetsHelper


	def compute_price(supplier_price, ipi, markup, quantity)

		
		price_per_unit = supplier_price + (supplier_price * (ipi/100)) + (supplier_price * (markup/100))
		price = price_per_unit * quantity
		return price
	
	end

end
