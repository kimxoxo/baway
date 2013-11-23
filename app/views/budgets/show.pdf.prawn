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

	budget_customer_cell.column(0).font_style = :bold
	budget_customer_cell.column(2).font_style = :bold
	budget_customer_cell.column(4).font_style = :bold

	budget_customer_cell.row(0).border_width = 0
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
	
	budget_customer_cell.column(0).font_style = :bold
	budget_customer_cell.column(2).font_style = :bold
	budget_customer_cell.column(4).font_style = :bold

	budget_customer_cell.row(0).border_width = 0
end


###END CUSTOMER TABLES###







pdf.move_down 1000


pdf.float do
	pdf.text "<b>cliente:</b> #{@budget.customer.name}", style: :normal, align: :left, inline_format: true
	#pdf.move_down 5
	pdf.text "<b>endereço:</b> #{@budget.customer.street}, #{@budget.customer.street_number}", style: :normal, align: :left, inline_format: true
	pdf.text "<b>cep:</b> #{@budget.customer.postal_code}", style: :normal, align: :left, inline_format: true
	pdf.text "<b>cidade:</b> #{@budget.customer.city}", style: :normal, align: :left, inline_format: true
	pdf.text "<b>tel:</b> #{@budget.customer.mobile}", style: :normal, align: :left, inline_format: true
	pdf.text "<b>email:</b> #{@budget.customer.mobile}", style: :normal, align: :left, inline_format: true
	pdf.text "<b>arquiteto(a):</b> #{User.find(@budget.arquitect_id).name}", style: :normal, align: :left, inline_format: true
	

	#pdf.text @budget.customer.name, style: :normal, align: :left
	#pdf.text "#{@budget.customer.street}, #{@budget.customer.street_number}", style: :normal, align: :left
	#pdf.text "#{@budget.customer.neighbourhood}, #{@budget.customer.postal_code}", style: :normal, align: :left
end

pdf.font_size = 8


pdf.float do
	pdf.text 'Emporio do Arquiteto', style: :normal, align: :right, inline_format: true
	pdf.move_down 5
	pdf.text 'Avenida Senador Filinto Müller, 920', style: :normal, align: :right
	pdf.text 'Goiabeiras | Cuiabá | MT | 78043-400', style: :normal, align: :right
	pdf.text '+55 65 3321-1257', style: :normal, align: :right
end
###END HEADER###
###END HEADER###
