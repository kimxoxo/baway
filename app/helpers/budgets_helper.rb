module BudgetsHelper


	def compute_price(supplier_price, ipi, markup, quantity, freight)

		
		price_per_unit = supplier_price + (supplier_price * (ipi/100)) + (supplier_price * markup)
		price = price_per_unit * quantity
		

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
