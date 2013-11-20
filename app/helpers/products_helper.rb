module ProductsHelper


	def string_to_float(string)

		#format price
		price_formated = string.gsub(/[^0-9,]/, '')
		price_formated = price_formated.gsub(',', '.')

		return price_formated
		
	end


end