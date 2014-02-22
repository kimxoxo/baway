###HEADER###
###HEADER###
pdf.font_size = 10




pdf.float do
	pdf.text "<b>Pedido nº</b> #{@request.request_number}", style: :normal, align: :left, inline_format: true
	pdf.text "#{@budget.updated_at.strftime('%d/%m/%Y')}", style: :normal, align: :left, inline_format: true

	pdf.image "#{Rails.root}/app/assets/images/emporio_logo.png", at: [670, 530], width: 100
end



pdf.move_down 20

architech_name = User.find(@budget.architect_id).name + ' ' + User.find(@budget.architect_id).surname


pdf.float do
	#pdf.text "Cliente", style: :bold, align: :left, inline_format: true
	pdf.move_down 15
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
	pdf.move_down 15
	#pdf.text "Emporio do Arquiteto", style: :normal, align: :right, inline_format: true
	pdf.text "Avenida Senador Filinto Müller, 920", style: :normal, align: :right, inline_format: true
	pdf.text "Cuiabá, MT, 78043-400, Goiabeiras", style: :normal, align: :right, inline_format: true
	pdf.text "(65) 3321-1257", style: :normal, align: :right, inline_format: true 
	pdf.move_down 5
	#pdf.text "Vendedor(a)", style: :bold, align: :right, inline_format: true
	#pdf.text "#{seller_name}", style: :normal, align: :right, inline_format: true
end








pdf.move_down 80


totals_quantity = 0
totals_price = 0



###PRODUCTS TABLE###
products = [[
						"tipo",
						"código",
						"fornecedor",
						"descrição",
						"ambiente",
						"frete",
						"entrega",
						"larg",
						"alt",
						"qt",
						"preço"]]


products += @request.budgets_products.map do |budget_product|

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




		#compute totals_quantity
		totals_quantity = totals_quantity + budget_product.quantity

		#compute totals_price
		totals_price = totals_price + budget_product.computed_price

	
	[
		(t :"activerecord.attributes.product.product_type#{product.product_type}"),
		product.code,
		product.supplier.name,
		product.description,
		budget_product.house_area,
		number_to_currency(budget_product.freight),
		"#{budget_product.days_to_delivery} dia(s)",
		product_width,
		product_height,		
		budget_product.quantity,
		number_to_currency(budget_product.computed_price)
	]
end



pdf.table(products, width: 770,
				  column_widths: {0 => 30,
				  								1 => 80,
							  				  2 => 100,
							  				  4 => 70,
							  				  5 => 65,
							  				  6 => 50,
							  				  7 => 50,
							  				  8 => 40,
							  				  9 => 30,
							  				  10 => 80},
		 		  header: true) do |product|

	#product.row(0).font_style = :bold
	#ticket.row(0).column(0).align = :right

	product.column(0..10).border_width = 0
	product.row(0).style(:background_color => "F4F3F3")
end

###END PRODUCTS TABLE###




pdf.move_down 40




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









pdf.move_down 50



pdf.float do


	#set freight
	if @budget.freight
		budget_freight = "sim"
	else
		budget_freight = "não"
	end


	#set instalation
	if @budget.instalation
		budget_instalation = "sim"
	else
		budget_instalation = "não"
	end



	###budget_details TABLE###
	budget_details = [ ["frete", budget_freight] ]
	budget_details += [ ["instalação", budget_instalation] ]


	pdf.table(budget_details,
						width: 100,
			 		  header: true, position: :left) do |budget_details_cell|

		budget_details_cell.column(0).font_style = :bold
		budget_details_cell.column(0..1).border_width = 0
	end
end




pdf.move_down 50
















pdf.float do


	#set budget observations
	if @budget.instalation_observations.blank?
		budget_instalation = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx sem condições xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

	else
		budget_instalation = "- #{@budget.instalation_observations}"
	end

	###PRODUCTS TOTALS TABLE###	
	users = [[
						"Condições de instalação:",
						"",
						""
						]]


	users += [[
						"Fica o cliente que para as devidas instalações dos produtos acima deverá tomar as seguintes providências:",
						"",
						""
						]]



	users += [[
						budget_instalation,
						"",
						""
						]]


	users += [[
						"assinatura:",
						"",
						""
						]]



	users += [[
						"recibo: recebi a importância de R$                       , referente a aquisição dos produtos acima, conforme condição acordada em cima.",
						"",
						""
						]]



	users += [[
						"assinatura:",
						"",
						""
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
						width: 640,
					  column_widths: {
					  								1 => 100,
					  								2 => 100
					  								},
			 		  header: false, position: :right) do |users_cell|

		users_cell.row(0).border_width = 0
		users_cell.row(1).border_width = 0
		users_cell.row(2).border_width = 0
		users_cell.row(3).border_width = 0
		users_cell.row(4).border_width = 0
		users_cell.row(5).border_width = 0



		users_cell.row(0).padding_top = 0
		users_cell.row(0).padding_bottom = 0


		users_cell.row(1).padding_top = 0
		users_cell.row(1).padding_bottom = 0


		users_cell.row(2).padding_top = 7

		users_cell.row(0).font_style = :bold
		users_cell.row(3).font_style = :bold
		users_cell.row(5).font_style = :bold


		users_cell.row(0).border_top_width = 1
		users_cell.row(5).border_bottom_width = 1
		users_cell.column(0).border_left_width = 1
		users_cell.column(0).border_right_width = 1
		users_cell.column(1).border_right_width = 0
		users_cell.column(2).border_right_width = 1
		users_cell.column(0).row(3).border_bottom_width = 1


	end
end





pdf.move_down 90




repeat(:all, :dynamic => true) do
	pdf.image "#{Rails.root}/app/assets/images/baway_logo_pdf.png", at: [0, 4.5], width: 40, align: :left
end


###FOOTER###
pdf.bounding_box([0,0], :width =>780) do


	number_pages "gestão de orçamentos inteligente", { :start_count_at => 0, :page_filter => :all, :at => [bounds.left + 45, 0], :align => :left, :size => 8 }
	number_pages "página <page> de <total>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 8 }
end
###END FOOTER###


