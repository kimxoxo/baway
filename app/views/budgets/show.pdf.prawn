###HEADER###
###HEADER###
pdf.font_size = 10

pdf.float do
	pdf.text "<b>Orçamento nº</b> #{@budget.id}", style: :normal, align: :center, inline_format: true
end


pdf.move_down 30

architech_name = User.find(@budget.architect_id).name


pdf.float do
	pdf.text "Cliente", style: :bold, align: :left, inline_format: true
	pdf.move_down 10
	pdf.text @budget.customer.name, style: :normal, align: :left
	pdf.text "#{@budget.customer.street}, #{@budget.customer.street_number}", style: :normal, align: :left
	pdf.text "#{@budget.customer.city}, #{@budget.customer.postal_code} #{@budget.customer.neighbourhood}", style: :normal, align: :left
	pdf.text "#{@budget.customer.mobile} #{@budget.customer.landline}", style: :normal, align: :left
	pdf.text "#{@budget.customer.email}", style: :normal, align: :left
	pdf.move_down 5
	pdf.text "Arquiteto(a)", style: :bold, align: :left, inline_format: true
	pdf.text "#{architech_name}", style: :normal, align: :left, inline_format: true
end


seller_name = User.find(@budget.seller_id).name

pdf.float do
	pdf.text "Cuiabá, #{@budget.updated_at.strftime('%d/%m/%Y')}", style: :normal, align: :right, inline_format: true
	pdf.move_down 10
	pdf.text "Emporio do Arquiteto", style: :normal, align: :right, inline_format: true
	pdf.text "Avenida Senador Filinto Müller, 920", style: :normal, align: :right, inline_format: true
	pdf.text "Cuiabá, MT, 78043-400, Goiabeiras", style: :normal, align: :right, inline_format: true
	pdf.text "(65) 3321-1257", style: :normal, align: :right, inline_format: true 
	pdf.move_down 5
	pdf.text "Vendedor(a)", style: :bold, align: :right, inline_format: true
	pdf.text "#{seller_name}", style: :normal, align: :right, inline_format: true

end




pdf.move_down 105


totals_quantity = 0
totals_price = 0

###PRODUCTS TABLE###
products = [["código",
						"fornecedor",
						"descrição",
						"medida",
						"qt",
						"preço"]]


products += @budget.products.map do |product|

	budget_product = @budget.budgets_products.find_by_product_id(product.id)

	price = compute_price(product.supplier_price, product.ipi, budget_product.markup, budget_product.quantity)
	#compute totals quantity
	totals_quantity = totals_quantity + budget_product.quantity
	#compute totals price
	totals_price = totals_price + price
	
	[
		product.code,
		product.supplier.name,
		product.description,
		"#{product.width} cm",
		budget_product.quantity,
		number_to_currency(price)
	]
end



pdf.table(products, width: 523,
				  column_widths: {0 => 50,
							  				  1 => 100,
							  				  3 => 50,
							  				  4 => 30,
							  				  5 => 70},
		 		  header: true) do |product|

	#product.row(0).font_style = :bold
	#ticket.row(0).column(0).align = :right

	product.column(0..5).border_width = 0
	product.row(0).style(:background_color => "F4F3F3")
end

###END PRODUCTS TABLE###




pdf.move_down 10




###PRODUCTS TOTALS TABLE###	
products_totals = [[
										"",
										"",
										"",
										"",
										totals_quantity,
										number_to_currency(totals_price)
									]]




pdf.table(products_totals,
					width: 523,
				  row_colors: ["FFFFFF","F4F3F3"],
				  column_widths:  {0 => 50,
									  				  1 => 100,
									  				  3 => 50,
									  				  4 => 30,
									  				  5 => 70},
		 		  header: false) do |products_totals_cell|

	products_totals_cell.row(0).font_style = :bold
	#ticket.row(0).column(0).align = :right

	products_totals_cell.row(0).border_width = 0
	#products_totals_cell.column(4..5).style(:background_color => "F4F3F3")
end






repeat(:all, :dynamic => true) do
	pdf.image "#{Rails.root}/app/assets/images/baway_logo_pdf.png", at: [0, 4.5], width: 40, align: :left
end


###FOOTER###
pdf.float do

	number_pages " - gestão de orçamentos inteligente", { :start_count_at => 0, :page_filter => :all, :at => [bounds.left + 45, 0], :align => :left, :size => 8 }
	number_pages "página <page> de <total>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 8 }
end
###END FOOTER###

