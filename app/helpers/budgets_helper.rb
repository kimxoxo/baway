module BudgetsHelper


	def compute_price(supplier_price, ipi, markup)

		
		price = supplier_price + (supplier_price * (ipi/100)) + (supplier_price * (markup/100))
		return price
	
	end

end
