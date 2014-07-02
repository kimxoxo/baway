###HEADER###
###HEADER###
###HEADER###
###HEADER###
###HEADER###
###HEADER###
pdf.font_size = 10


pdf.float do
	pdf.text "<b>Orçamento nº</b> #{@budget.id}", size: 13, style: :normal, align: :left, inline_format: true
	pdf.text "#{@budget.updated_at.strftime('%d/%m/%Y')}", style: :normal, align: :left, inline_format: true

	pdf.image "#{Rails.root}/app/assets/images/emporio_logo.png", at: [665, 530], width: 105
end


pdf.move_down 20

architech_name = User.find(@budget.architect_id).name + ' ' + User.find(@budget.architect_id).surname

##cliente
##cliente
##cliente
pdf.float do
  pdf.move_down 15
	pdf.text "<b>cliente</b> #{@budget.customer.name}", size: 13 , style: :normal, align: :left, inline_format: true
	
	if @budget.customer.street != ""
		pdf.text "#{@budget.customer.street}, #{@budget.customer.street_number}", style: :normal, align: :left
	end
	

	city_postalCode_neighbourhood = @budget.customer.city

	if @budget.customer.city != ""
		city_postalCode_neighbourhood = city_postalCode_neighbourhood + ", #{@budget.customer.city}"
	end

	if @budget.customer.postal_code != ""
		city_postalCode_neighbourhood = city_postalCode_neighbourhood + ", #{@budget.customer.postal_code}"
	end

	if @budget.customer.neighbourhood != ""
		city_postalCode_neighbourhood = city_postalCode_neighbourhood + ", #{@budget.customer.neighbourhood}"
	end


	if city_postalCode_neighbourhood != ""
		pdf.text city_postalCode_neighbourhood, style: :normal, align: :left
	end


	if @budget.customer.mobile
		pdf.text "#{@budget.customer.mobile}", style: :normal, align: :left
	end

	if @budget.customer.landline
		pdf.text "#{@budget.customer.landline}", style: :normal, align: :left
	end


	pdf.text "#{@budget.customer.email}", style: :normal, align: :left
	pdf.move_down 5
end

##cliente
##cliente
##cliente


seller_name = User.find(@budget.seller_id).name

pdf.float do
	pdf.move_down 15
	pdf.text "Avenida Senador Filinto Müller, 920", style: :normal, align: :right, inline_format: true
	pdf.text "Cuiabá, MT, 78043-400, Goiabeiras", style: :normal, align: :right, inline_format: true
	pdf.text "(65) 3321-1257", style: :normal, align: :right, inline_format: true 
	pdf.move_down 5
end


pdf.move_down 80


totals_quantity = 0
totals_price = 0


###PRODUCTS TABLE###
###PRODUCTS TABLE###
###PRODUCTS TABLE###
###PRODUCTS TABLE###
	products_row = [
									"ambiente"
									]



	products_row += [
									"tipo"
									]


if params[:code]
	products_row += [
									"código"
									]
end


if params[:supplier]
	products_row += [
									"fornecedor"
									]
end



if params[:description]
	products_row += [
									"descrição"
									]
end


if params[:observations]
	products_row += [
									"observações"
									]
end



if params[:freight]
	products_row += [
									"frete"
									]
end



	products_row += [
									"entrega"
									]

if params[:width]
	products_row += [
									"larg"
									]
end


if params[:height]
	products_row += [
									"alt"
									]
end


if params[:quantity]
	products_row += [
									"qt"
									]
end


	products_row += [
									"preço"
									]


products = [products_row]



#products += @budget.budgets_products.map do |budget_product|
@budget.budgets_products.where(show: [nil, true]).order("house_area ASC").order("product_type DESC").each do |budget_product|

	product = Product.find(budget_product.product_id)

	#define width
	if product.width != 0
		product_width = "#{product.width} m"
	else
		product_width = "#{budget_product.width} m"
	end


	#define height
	if budget_product.height
		product_height = "#{budget_product.height} m"
	else
		product_height = "n/a"
	end


		#compute totals_quantity
		totals_quantity = totals_quantity + budget_product.quantity

		#compute totals_price
		totals_price = totals_price + budget_product.computed_price




	products_row = [
									budget_product.house_area
									]



	products_row += [
									(t :"activerecord.attributes.product.product_type_full#{product.product_type}")
									]



	if params[:code]
		products_row += [
										product.code
										]
	end


	if params[:supplier]
		products_row += [
										product.supplier.name.downcase
										]
	end



	if params[:description]
		products_row += [
										product.description.downcase
										]
	end


	if params[:observations]
		products_row += [
										budget_product.product_observations
										]
	end


	if params[:freight]
		products_row += [
										number_to_currency(budget_product.freight)
										]
	end



	products_row += [
									"#{budget_product.days_to_delivery} dia(s)"
									]



	if params[:width]
		products_row += [
										product_width
										]
	end




	if params[:height]
		products_row += [
										product_height
										]
	end



	if params[:quantity]
		products_row += [
										budget_product.quantity
										]
	end



	products_row += [
									number_to_currency(budget_product.computed_price)
									]



	products += [products_row]

end



pdf.table(products, width: 770,
				  column_widths: {},
		 		  header: true) do |product|

	#product.row(0).font_style = :bold
	#ticket.row(0).column(0).align = :right

	product.column(0..13).border_width = 0
	product.row(0).style(:background_color => "F4F3F3")
end

###END PRODUCTS TABLE###
###END PRODUCTS TABLE###
###END PRODUCTS TABLE###
###END PRODUCTS TABLE###



pdf.float do


	###PRODUCTS TOTALS TABLE###	
	#products_totals = #[[
											#{}"quantidade itens",
											#totals_quantity
										#]]


	products_totals = [[
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




pdf.move_down 70






if @budget.instant_payment


	budget_total = 0
	budget_total = totals_price - @budget.discount


	budget_total_with_discount = budget_total - (budget_total * (@budget.instant_payment_discount/100))

	payment_conditions = [[
		          					"opções de pagamento",
	  										"#{number_to_currency(budget_total_with_discount)} à vista (#{@budget.instant_payment_discount}% desconto)"
												]]


		pdf.table(payment_conditions,
							width: 770,
							column_widths:  {0 => 140},
				 		  header: true) do |payment_condition_cell|

			#product.row(0).font_style = :bold
			#ticket.row(0).column(0).align = :right

			payment_condition_cell.column(0..10).border_width = 0
			payment_condition_cell.column(0).font_style = :bold
			payment_condition_cell.row(0).style(:background_color => "F4F3F3")
		end

end








payment_conditions_active = ""

@budget.payment_conditions.each do |pc|
	if pc.active
			payment_conditions_active = payment_conditions_active + "               #{pc.num_monthly_payments}  x  #{number_to_currency((totals_price - @budget.initial_payment - @budget.discount)/pc.num_monthly_payments)}"
	end
end


payment_conditions = [[
	          					"opções de pagamento",
  										"entrada: #{number_to_currency(@budget.initial_payment)}",
  										payment_conditions_active
											]]




if payment_conditions_active != ""
	pdf.table(payment_conditions,
						width: 770,
						column_widths:  {0 => 140,
														 1 => 120},
			 		  header: true) do |payment_condition_cell|

		#product.row(0).font_style = :bold
		#ticket.row(0).column(0).align = :right

		payment_condition_cell.column(0..10).border_width = 0
		payment_condition_cell.column(0).font_style = :bold
		payment_condition_cell.row(0).style(:background_color => "F4F3F3")
	end
end



if @budget.observations != nil && !@budget.observations.blank?

	pdf.move_down 10


	date_plus_30days =  @budget.updated_at + 30.days
	date_plus_30days = date_plus_30days.strftime('%d/%m/%Y')

	budget_is_valid_up_to = [[
														"Observações      #{@budget.observations}"
													]]


	pdf.table(budget_is_valid_up_to,
						width: 769,
						column_widths:  {},
			 		  header: true) do |payment_condition_cell|

		#product.row(0).font_style = :bold
		#ticket.row(0).column(0).align = :right

		payment_condition_cell.column(0..10).border_width = 0
		#payment_condition_cell.column(0).font_style = :bold
		payment_condition_cell.row(0).style(:background_color => "F4F3F3")
	end
end



pdf.move_down 10


date_plus_30days =  @budget.updated_at + 30.days
date_plus_30days = date_plus_30days.strftime('%d/%m/%Y')

budget_is_valid_up_to = [[
	          						"Este orçamento tem validade de 30dias, após a sua emissão."
												]]


pdf.table(budget_is_valid_up_to,
					width: 769,
					column_widths:  {},
		 		  header: true) do |payment_condition_cell|

	#product.row(0).font_style = :bold
	#ticket.row(0).column(0).align = :right

	payment_condition_cell.column(0..10).border_width = 0
	payment_condition_cell.column(0).font_style = :bold
	payment_condition_cell.row(0).style(:background_color => "F4F3F3")
end



pdf.move_down 20



@seller = User.find(@budget.seller_id)


pdf.float do
	pdf.text "<b>Arquiteto(a)</b> #{architech_name}", style: :normal, align: :left, inline_format: true
	pdf.move_down 5
	pdf.text "<b>Consultor(a)</b> #{@seller.name} #{@seller.surname}     <b>phone</b> #{@seller.mobile}    <b>email</b> #{@seller.email}", style: :normal, align: :left, inline_format: true
end











# pdf.float do


# 	@budget_payment_conditions = @budget.payment_conditions.sort_by(&:id)

# 	budget_payment_conditions_active = [["kim", "mane"]]



# 	budget_payment_conditions_active += @budget.payment_conditions.sort_by(&:id).map do |pc|

# 		if pc.active
# 			#["#{pc.num_monthly_payments}  x  #{number_to_currency((totals_price - @budget.initial_payment)/pc.num_monthly_payments)}"]
# 			["kim", "tono"]
# 		end
# 	end





# 	###PAYMENT CONDITIONS TABLE###
# 	payment_conditions = [[
# 												 "opções de pagamento",
# 												 "entrada: #{number_to_currency(@budget.initial_payment)}"
												 
# 												]]
												




# 	pdf.table(budget_payment_conditions_active,
						
# 			 		  header: true, position: :left) do |payment_conditions_cell|

# 		payment_conditions_cell.column(0).font_style = :bold
# 		#payment_conditions_cell.row(0).padding_top = 8
# 		#payment_conditions_cell.row(0).padding_bottom = 8

# 		#payment_conditions_cell.column(0).border_width = 1
# 		#payment_conditions_cell.column(0).border_right_width = 0


# 	end
# end









pdf.move_down 20



# pdf.float do


# 	pdf.text "<b>Recebi a importância de R$                       , referente a aquisição dos produtos acima, conforme condição acordada em cima.</b>", style: :normal, align: :left, inline_format: true


# 	#set budget observations
# 	if @budget.instalation_observations.blank?
# 		budget_instalation = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx sem condições xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# 	else
# 		budget_instalation = "- #{@budget.instalation_observations}"
# 	end

# 	###PRODUCTS TOTALS TABLE###	
# 	users = [[
# 						"Condições de instalação:",
# 						"",
# 						""
# 						]]


# 	users += [[
# 						"Fica o cliente que para as devidas instalações dos produtos acima deverá tomar as seguintes providências:",
# 						"",
# 						""
# 						]]



# 	users += [[
# 						budget_instalation,
# 						"",
# 						""
# 						]]


# 	users += [[
# 						"assinatura:",
# 						"",
# 						""
# 						]]



# 	users += [[
# 						"recibo: recebi a importância de R$                       , referente a aquisição dos produtos acima, conforme condição acordada em cima.",
# 						"",
# 						""
# 						]]



# 	users += [[
# 						"assinatura:",
# 						"",
# 						""
# 						]]



# end





# pdf.move_down 90



###FOOTER###
###FOOTER###
###FOOTER###
###FOOTER###
repeat(:all, :dynamic => true) do
	pdf.image "#{Rails.root}/app/assets/images/baway_logo_pdf.png", at: [0, 4.5], width: 40, align: :left
end


pdf.bounding_box([0,0], :width =>780) do

	number_pages "gestão de orçamentos inteligente", { :start_count_at => 0, :page_filter => :all, :at => [bounds.left + 45, 0], :align => :left, :size => 8 }
	number_pages "página <page> de <total>", { :start_count_at => 0, :page_filter => :all, :at => [bounds.right - 50, 0], :align => :right, :size => 8 }
end
###END FOOTER###
###END FOOTER###
###END FOOTER###
###END FOOTER###


