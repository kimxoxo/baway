###HEADER###
###HEADER###
pdf.font_size = 10




pdf.float do
	pdf.text "<b>orçamento nº</b> #{@budget.id}", style: :normal, align: :left, inline_format: true
end


pdf.float do
	pdf.text "<b>data</b> #{@budget.updated_at.strftime('%m/%d/%Y')}", style: :normal, align: :right, inline_format: true
end




pdf.move_down 20


###CUSTOMER TABLES###
budget_customer_cells = [["cliente",
				 				 					"#{@budget.customer.name}"]]

pdf.table(budget_customer_cells,
		  width: 523,
		  column_widths: {0 => 50},
 		  header: true) do |budget_customer_cell|

	budget_customer_cell.column(0).align = :right

	budget_customer_cell.column(0).font_style = :bold
	budget_customer_cell.column(2).font_style = :bold
	budget_customer_cell.column(4).font_style = :bold

	budget_customer_cell.row(0).border_width = 0

	budget_customer_cell.row(0).style(:background_color => "F4F3F3")
end



budget_customer_cells = [["rua",
				 				 					"#{@budget.customer.street}, #{@budget.customer.street_number}"]]

pdf.table(budget_customer_cells,
		  width: 523,
		  column_widths: {0 => 50, 2 => 30, 3 => 60, 4 => 40},
 		  header: true) do |budget_customer_cell|

	budget_customer_cell.column(0).align = :right

	budget_customer_cell.column(0).font_style = :bold
	budget_customer_cell.column(2).font_style = :bold
	budget_customer_cell.column(4).font_style = :bold

	budget_customer_cell.row(0).border_width = 0

	budget_customer_cell.row(0).style(:background_color => "F4F3F3")
end



bairro = ""

if @budget.customer.neighbourhood != ""
	bairro = @budget.customer.neighbourhood
else
	bairro = "-"
end

budget_customer_cells = [["cep",
				 				 					@budget.customer.postal_code,
				 				 					"cidade",
				 				 					@budget.customer.city,
				 				 					"bairro",
				 				 					bairro]]

pdf.table(budget_customer_cells,
		  width: 523,
		  column_widths: {0 => 50, 1 => 90, 2 => 50, 3 => 120, 4 => 40},
 		  header: true) do |budget_customer_cell|


	budget_customer_cell.column(0).align = :right
	budget_customer_cell.column(2).align = :right
	budget_customer_cell.column(4).align = :right

	budget_customer_cell.column(0).font_style = :bold
	budget_customer_cell.column(2).font_style = :bold
	budget_customer_cell.column(4).font_style = :bold

	budget_customer_cell.row(0).border_width = 0

	budget_customer_cell.row(0).style(:background_color => "F4F3F3")
end





budget_customer_cells = [["celular",
				 				 					@budget.customer.mobile,
				 				 					"fixo",
				 				 					@budget.customer.landline,
				 				 					"email",
				 				 					@budget.customer.landline]]

pdf.table(budget_customer_cells,
		  width: 523,
		  column_widths: {0 => 50, 1 => 90, 2 => 50, 3 => 120, 4 => 40 },
 		  header: true) do |budget_customer_cell|



	budget_customer_cell.column(0).align = :right
	budget_customer_cell.column(2).align = :right
	budget_customer_cell.column(4).align = :right


	budget_customer_cell.column(0).font_style = :bold
	budget_customer_cell.column(2).font_style = :bold
	budget_customer_cell.column(4).font_style = :bold

	budget_customer_cell.row(0).border_width = 0

	budget_customer_cell.row(0).style(:background_color => "F4F3F3")
end


###END CUSTOMER TABLES###

pdf.move_down 40




###PRODUCTS TABLE###
products = [["código",
						"fornecedor",
						"descrição",
						"medida",
						"preço",
						"qt"]]







products += @budget.products.map do |product|


	budget_product = @budget.budgets_products.find_by_product_id(product.id)

	price = compute_price(product.supplier_price, product.ipi, budget_product.markup, budget_product.quantity)

	
	[
		product.code,
		product.supplier.name,
		product.description,
		"#{product.width} cm",
		number_to_currency(price),
		budget_product.quantity
	]
end



pdf.table(products, width: 523,
		  row_colors: ["FFFFFF","F4F3F3"],
		  column_widths: {0 => 50,
					  				  1 => 100},
 		  header: true) do |product|

	product.row(0).font_style = :bold
	#ticket.row(0).column(0).align = :right

end

###END PRODUCTS TABLE###




