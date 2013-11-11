module BudgetsHelper


	def compute_price(supplier_price, ipi, markup, quantity)

		
		price_per_unit = supplier_price + (supplier_price * (ipi/100)) + (supplier_price * (markup/100))
		price = price_per_unit * quantity
		return price
	
	end



  def currency_to_number(currency)

    #converts currency x.xxx,xx type to decimal

    currency = currency.gsub('.', '')
    currency = currency.gsub(',', '.')
    currency = currency.to_f

    return currency
  end



end
