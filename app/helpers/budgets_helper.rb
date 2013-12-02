module BudgetsHelper


	def compute_price(product_type, supplier_price, ipi, markup, quantity, freight, width, height)

		if product_type == 1
			
			price_per_unit = supplier_price + (supplier_price * (ipi/100)) + (supplier_price * markup)
			price = price_per_unit * quantity
		
		elsif product_type == 2

			size_square_meters = (width * height) / 10000

			price_per_unit = (size_square_meters * supplier_price) * (ipi/100) * markup
			price = price_per_unit * quantity			

		elsif product_type == 3

			price_plus_freight = 0
			price = 0

		end

		price_plus_freight = price + freight

		return price_plus_freight
	end



  def currency_to_number(currency)

    #converts currency x.xxx,xx type to decimal
    currency = currency.to_s

    currency = currency.gsub('.', '')
    currency = currency.gsub(',', '.')
    currency = currency.to_f

    return currency
  end



end
