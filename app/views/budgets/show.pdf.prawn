###HEADER###
###HEADER###
pdf.font_size = 10




pdf.float do
	pdf.text "<b>Orçamento nº</b> #{@budget.id}", style: :normal, align: :left, inline_format: true
	pdf.text "#{@budget.updated_at.strftime('%d/%m/%Y')}", style: :normal, align: :left, inline_format: true

	pdf.image "#{Rails.root}/app/assets/images/emporio_logo.png", at: [670, 530], width: 100
end



pdf.move_down 20

architech_name = User.find(@budget.architect_id).name


pdf.float do
	#pdf.text "Cliente", style: :bold, align: :left, inline_format: true
	pdf.move_down 10
	pdf.text "Cliente: #{@budget.customer.name}", style: :normal, align: :left
	pdf.text "#{@budget.customer.street}, #{@budget.customer.street_number}", style: :normal, align: :left
	pdf.text "#{@budget.customer.city}, #{@budget.customer.postal_code} #{@budget.customer.neighbourhood}", style: :normal, align: :left
	pdf.text "#{@budget.customer.mobile} #{@budget.customer.landline}", style: :normal, align: :left
	pdf.text "#{@budget.customer.email}", style: :normal, align: :left
	pdf.move_down 5
	#pdf.text "Arquiteto(a)", style: :bold, align: :left, inline_format: true
	#pdf.text "#{architech_name}", style: :normal, align: :left, inline_format: true
end


seller_name = User.find(@budget.seller_id).name

pdf.float do
	#pdf.text "Cuiabá, #{@budget.updated_at.strftime('%d/%m/%Y')}", style: :normal, align: :right, inline_format: true
	pdf.move_down 10
	#pdf.text "Emporio do Arquiteto", style: :normal, align: :right, inline_format: true
	pdf.text "Avenida Senador Filinto Müller, 920", style: :normal, align: :right, inline_format: true
	pdf.text "Cuiabá, MT, 78043-400, Goiabeiras", style: :normal, align: :right, inline_format: true
	pdf.text "(65) 3321-1257", style: :normal, align: :right, inline_format: true 
	pdf.move_down 5
	#pdf.text "Vendedor(a)", style: :bold, align: :right, inline_format: true
	#pdf.text "#{seller_name}", style: :normal, align: :right, inline_format: true
end




pdf.move_down 70


totals_quantity = 0
totals_price = 0

###PRODUCTS TABLE###
products = [["código",
						"fornecedor",
						"descrição",
						"tipo",
						"ambiente",
						"entrega",
						"larg",
						"alt",
						"qt",
						"preço"]]


products += @budget.budgets_products.map do |budget_product|

	product = Product.find(budget_product.product_id)



	#define width
	if product.width != 0
		product_width = "#{product.width} cm"
	else
		product_width = "#{budget_product.width} cm"
	end


	#define height
	if budget_product.height
		product_height = "#{budget_product.height} cm"
	else
		product_height = "n/a"
	end


	#compute price
	@price = nil

 	if product.product_type == 1

		if(product.supplier_price && product.ipi && product.markup && product.supplier_table_discount && budget_product.quantity && budget_product.freight)
		
			@price = compute_price_product_type_1(product.supplier_price,
																					  product.ipi,
																					  product.markup,
																					  product.supplier_table_discount,
																					  budget_product.quantity,
																					  budget_product.freight)
		end

		elsif product.product_type == 2


			if(product.supplier_price && product.ipi && product.markup && budget_product.quantity && budget_product.freight && budget_product.width && budget_product.height)
									
				@price = compute_price_product_type_2(product.supplier_price,
																						  product.ipi,
																						  product.markup,
																						  budget_product.quantity,
																						  budget_product.freight,
																						  budget_product.width,
																						  budget_product.height)

			end

		elsif product.product_type == 3

		end


		#compute totals_quantity
		totals_quantity = totals_quantity + budget_product.quantity

		#compute totals_price
		totals_price = totals_price + @price

	
	[
		product.code,
		product.supplier.name,
		product.description,
		(t :"activerecord.attributes.product.product_type_full_#{product.product_type}"),
		budget_product.house_area,
		"#{budget_product.days_to_delivery} dia(s)",
		product_width,
		product_height,		
		budget_product.quantity,
		number_to_currency(@price)
	]
end



pdf.table(products, width: 770,
				  column_widths: {0 => 50,
							  				  1 => 100,
							  				  3 => 70,
							  				  5 => 50,
							  				  6 => 50,
							  				  7 => 60,
							  				  8 => 30,
							  				  9 => 80},
		 		  header: true) do |product|

	#product.row(0).font_style = :bold
	#ticket.row(0).column(0).align = :right

	product.column(0..9).border_width = 0
	product.row(0).style(:background_color => "F4F3F3")
end

###END PRODUCTS TABLE###




pdf.move_down 10




pdf.float do

	###PRODUCTS TOTALS TABLE###	
	users = [[
						"Arquiteto(a)",
						 architech_name
						]]

	users += [[
						"Vendedor(a)",
						current_user.name
						]]


	# users += [[
	# 					"entrada",
	# 					"R$ 100,00"
	# 					]]

	# users += [[
	# 					"opções pag",
	# 					"R$ 100,00"
	# 					]]



	# users += [[
	# 					"opções pag",
	# 					"R$ 100,00"
	# 					]]


	pdf.table(users,
						width: 300,
					  column_widths:  {0 => 70},
			 		  header: false, position: :left) do |users_cell|

		users_cell.row(0).border_width = 0
		users_cell.row(1).border_width = 0
		users_cell.row(2).border_width = 0
		users_cell.row(3).border_width = 0

		users_cell.column(0).font_style = :bold
	end
end





pdf.float do


	###PRODUCTS TOTALS TABLE###	
	products_totals = [[
											"quantidade itens",
											totals_quantity
										]]


	products_totals += [[
											"sub-total",
											number_to_currency(totals_price)
										]]


	if @budget.discount > 0

		###PRODUCTS TOTALS TABLE###	
		products_totals += [[
												"desconto",
												number_to_currency(@budget.discount)
											]]

		



		###PRODUCTS TOTALS TABLE###	
		budget_total = 0

		budget_total = totals_price - @budget.discount


		products_totals += [[
												"total",
												number_to_currency(budget_total)
											]]

	end




	pdf.table(products_totals,
						width: 300,
					  column_widths:  {1 => 80},
			 		  header: false, position: :right) do |products_totals_cell|

		#products_totals_cell.row(0).font_style = :bold
		products_totals_cell.row(3).font_style = :bold

		products_totals_cell.column(0).align = :right

		products_totals_cell.row(0).border_width = 0
		products_totals_cell.row(1).border_width = 0
		products_totals_cell.row(2).border_width = 0
		products_totals_cell.row(3).border_width = 0
	end
end



pdf.move_down 90



# pdf.float do



# 		###PAYMENT CONDITIONS TABLE###
# 		payment_conditions = [["condições de pagamento",
# 													 ""]]

# 		payment_conditions += @budget.payment_conditions.map do |payment_condition|

# 			[
# 			"condições de pagamento",
# 			payment_condition.id
# 			]
# 		end


# 		pdf.table(payment_conditions,
# 							width: 200,
# 						  row_colors: ["FFFFFF","F4F3F3"],
# 						  column_widths:  {},
# 				 		  header: true, position: :left) do |payment_conditions_cell|

# 			payment_conditions_cell.row(0).font_style = :bold
# 			payment_conditions_cell.column(0).align = :right

# 			payment_conditions_cell.row(0).border_width = 0
# 		end
# 	end





repeat(:all, :dynamic => true) do
	pdf.image "#{Rails.root}/app/assets/images/baway_logo_pdf.png", at: [0, 4.5], width: 40, align: :left
end


###FOOTER###
pdf.float do

	number_pages "gestão de orçamentos inteligente", { :start_count_at => 0, :page_filter => :all, :at => [bounds.left + 55, 1], :align => :left, :size => 8 }
	number_pages "página <page> de <total>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 8 }
end
###END FOOTER###


