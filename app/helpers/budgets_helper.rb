module BudgetsHelper







	def compute_price(product_type, supplier_price, ipi, markup, supplier_table_discount, quantity, freight, width, height, computed_price, up)
	

		if (product_type == 0 || product_type == 1 || product_type == 3 || product_type == 5)

			if supplier_price && ipi && markup && supplier_table_discount && quantity && freight


				price_per_unit = ((supplier_price - (supplier_price * (supplier_table_discount/100))) + (supplier_price * (ipi/100))) * markup
				price = price_per_unit * quantity
				

				price_plus_freight = price + freight

				#compute with "up" constant
				if up
					price_plus_freight = price_plus_freight + (up/100 * price_plus_freight)
				end

				return price_plus_freight
			
			end

		elsif product_type == 2
			
			if supplier_price && ipi && markup && quantity && freight && width && height

				size_square_meters = (width * height)

				price_per_square_meter = size_square_meters * supplier_price

				price_per_unit = (price_per_square_meter + (price_per_square_meter * (ipi/100))) * markup

				price_plus_freight = price_per_unit + freight

				#compute with "up" constant
				if up
					price_plus_freight = price_plus_freight + (up/100 * price_plus_freight)
				end

				return price_plus_freight

			end

		elsif product_type == 6

			if computed_price != nil
								

				price_plus_freight = computed_price + freight

				#compute with "up" constant
				if up
					price_plus_freight = price_plus_freight + (up/100 * price_plus_freight)
				end

				return price_plus_freight

			end

		end

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
