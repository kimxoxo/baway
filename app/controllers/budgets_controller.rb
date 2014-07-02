class BudgetsController < ApplicationController

  before_filter :authenticate_user!



  # GET /budgets
  # GET /budgets.json
  def index

		#if params[:budget_id]
			@budgets = Budget.where(deleted: nil).paginate(page: params[:page], per_page: 10).order('created_at DESC')
		#else
    	#@budgets = Budget.paginate(page: params[:page], per_page: 10).order('created_at DESC')
		#end

		if params[:deleted]
			@budgets = Budget.where(deleted: true).paginate(page: params[:page], per_page: 10).order('created_at DESC')
		end	


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budgets }
    end
  end





  # GET /budgets/1
  # GET /budgets/1.json
  def show
    @budget = Budget.find(params[:id])
    
    prawnto prawn: {page_size: "A4", page_layout: :landscape}, inline: true


    #respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @budget }
    #end
  end




  def products_search

    #view_context to include the function from aplication helper
    #if view_context.is_numeric?(params[:product][:search_phrase])
    #else
    #end

    ##force the user to fill search_phrase or "no results"
    if !params[:product][:search_phrase].blank?
	    ##query for code
	    @products_search_list1 = Product.where(supplier_id: params[:product][:supplier_id], visible: true).where("lower(code) LIKE ? ", "%#{params[:product][:search_phrase].downcase}%").limit(25)
	    ##query for description
	    @products_search_list2 = Product.where(supplier_id: params[:product][:supplier_id], visible: true).where("lower(description) LIKE ?", "%#{params[:product][:search_phrase].downcase}%").limit(25)

	    ##merge results
			@products_search_list = (@products_search_list1 + @products_search_list2).uniq
		else

			@products_search_list = []

		end


    @budget = Budget.find(params[:product][:budget_id])

    respond_to do |format|
      format.js
    end        
  end



  def update_products_list

		@budget  = Budget.find(params[:budget_id])
		@product = Product.find(params[:product_id])

    @budgets_products = @budget.budgets_products

    @suppliers = Supplier.order('name ASC')

    #delete product from budget list
    if params[:delete]
      #@budget.products.find(@product.id).destroy      

			@budget.budgets_products.find(params[:budget_product_id]).destroy

      flash.now[:notice] = (t :"flash_messages.removed_product_from_the_list_successfully")

    #else if not params[:delete]
    else
    	#budget details changed so status must be always = 1
    	@budget.status = 1
    	@budget.save!

	    @product.budgets << @budget

	    flash.now[:success] = (t :"flash_messages.added_product_to_budget_list_successfully")

			@budget_product = @budget.budgets_products.order("id DESC").find_by_product_id(@product.id)
			#@budget_product.update_attributes(active: true)

			#in case product is a carpet only width and height will be add, quantity must be 1 and not editable
			if @product.product_type == 2 || @product.product_type == 6
		    @budget_product.update_attributes(quantity: 1)
			end

	    @budget_product.update_attributes(product_type: @product.product_type)

    end


    respond_to do |format|
      format.js
    end
  end



  def update_product_attributes

    @budgets_product = BudgetsProduct.find(params[:budgets_product][:id])
    @budget = Budget.find(@budgets_product.budget_id)
    @budgets_products = @budget.budgets_products
    @product = Product.find(@budgets_product.product_id)

    @suppliers = Supplier.all


    if !params[:budgets_product][:freight].blank?
			params[:budgets_product][:freight] = view_context.currency_to_number(params[:budgets_product][:freight])
		end


    if !params[:budgets_product][:computed_price].blank?
			params[:budgets_product][:computed_price] = view_context.currency_to_number(params[:budgets_product][:computed_price])
		end


    if !params[:budgets_product][:quantity].blank?
			params[:budgets_product][:quantity] = params[:budgets_product][:quantity].gsub(',', '.')
		end



    #budget details changed so status must be always = 1
    if !params[:budgets_product][:budget_status_dont_change]
    	@budget.status = 1
    	@budget.save
    end


    #in case product_type == 6 the computed_price must be inserted into the DB before calculating the price
    if params[:budgets_product][:computed_price]
			@budgets_product.update_attributes(params[:budgets_product])
		end



 		@price = view_context.compute_price(@product.product_type,
 																				@product.supplier_price,
																				@product.ipi,
																				@product.markup,
																				@product.supplier_table_discount,
																				@budgets_product.quantity,
																				@budgets_product.freight,
																				@budgets_product.width,
																				@budgets_product.height,
																				@budgets_product.computed_price,
																				@budgets_product.up)																				

 		params[:budgets_product][:computed_price] = @price


		if !params[:budgets_product][:width].blank?
			params[:budgets_product][:width] = (params[:budgets_product][:width].gsub(',', '.')).to_f
		end

		if !params[:budgets_product][:height].blank?
			params[:budgets_product][:height] = (params[:budgets_product][:height].gsub(',', '.')).to_f
		end

    @budgets_product.update_attributes(params[:budgets_product])

    respond_to do |format|
      format.js
    end
  end



  # GET /budgets/new
  # GET /budgets/new.json
  def new
    @budget = Budget.new
    @customer = Customer.new
    @architect = User.new


    @architects = User.where(id: 2)
    @architects += User.where(deleted: nil).where(role: 2).where("id != ?", 2).order('name ASC')


    if params[:tax_number]
      @customer = Customer.find_by_tax_number(params[:tax_number])
    end

    #if params[:budget]
      #@customer = params[:budget][:customer_attributes]
      #@customer.save
    #end

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @budget }
      format.js
    end
  end


  # GET /budgets/1/edit
  def edit
    @budget = Budget.find(params[:id])
    @product = Product.new
    @products = @budget.products.order('created_at ASC')
    @products_search_list = []

    @budgets_products = @budget.budgets_products.order('id DESC')

    @suppliers = Supplier.order('name ASC')

    @architects = User.where(id: 2)
    @architects += User.where(deleted: nil).where(role: 2).where("id != ?", 2).order('name ASC')
  end


  # POST /budgets
  # POST /budgets.json
  def create

    @budget = Budget.new(params[:budget])
    @budget.status = 1
    @budget.discount = 0
    @budget.initial_payment = 0


    respond_to do |format|
      if @budget.save

      	#create 4 payment conditions for each budget
    		PaymentCondition.new(budget_id: @budget.id, num_monthly_payments: "1x").save
        PaymentCondition.new(budget_id: @budget.id, num_monthly_payments: "2x").save
    		PaymentCondition.new(budget_id: @budget.id, num_monthly_payments: "3x").save
    		PaymentCondition.new(budget_id: @budget.id, num_monthly_payments: "").save
    

        #format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.html { redirect_to action: 'edit', id: @budget.id }
        format.json { render json: @budget, status: :created, location: @budget }
      else
        format.html { render action: "new" }
        #format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end







  # PUT /budgets/1
  # PUT /budgets/1.json
  def update
    @budget = Budget.find(params[:id])

    @product = Product.new    
    @products = @budget.products.order('created_at DESC')
    @products_search_list = []
    @budgets_products = @budget.budgets_products


    @suppliers = Supplier.all

    if !params[:budget][:discount].blank?
			params[:budget][:discount] = view_context.currency_to_number(params[:budget][:discount])
		end


    if params[:budget][:payment_condition]
			PaymentCondition.update(params[:budget][:payment_condition].keys, params[:budget][:payment_condition].values)
			@budget.status = 1
			@budget.save
		end


    if !params[:budget][:initial_payment].blank?
			params[:budget][:initial_payment] = view_context.currency_to_number(params[:budget][:initial_payment])
		end


    respond_to do |format|
      if @budget.update_attributes(params[:budget])
        #format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.html { render action: 'edit' }
        format.js
      elsif !@budget.update_attributes(params[:budget])
        format.html { render action: 'edit' }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end




	def validate_budget
 	
		@budget = Budget.find(params[:budget][:id])

    if @budget.update_attributes(params[:budget])
    	respond_to do |format|
    	  format.js
    	end
    end
	end




  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget = Budget.find(params[:id])
    #@budget.destroy


    @budget.deleted = true
    @budget.save

	  respond_to do |format|
     	format.html { redirect_to budgets_path }
    end
  end



	def compute_product_type3
		

		params[:curtain][:window_width] = (params[:curtain][:window_width].gsub(',', '.')).to_f
		params[:curtain][:window_height] = (params[:curtain][:window_height].gsub(',', '.')).to_f			
		params[:curtain][:window_number_parts] = (params[:curtain][:window_number_parts].gsub(',', '.')).to_i
		params[:curtain][:wave_factor] = (params[:curtain][:wave_factor].gsub(',', '.')).to_f
		params[:curtain][:fabric_width] = (params[:curtain][:fabric_width].gsub(',', '.')).to_f


		if params[:curtain][:id] != ""
			@curtain = Curtain.find(params[:curtain][:id])
		else
			@curtain = Curtain.new(params[:curtain])
		end

		@budgets_product = BudgetsProduct.find(params[:curtain][:budgets_product_id])

		@budget = Budget.find_by_id(@budgets_product.budget_id)

		if params[:curtain][:window_width] != "" && params[:curtain][:window_height] != "" && params[:curtain][:window_number_parts] != "" && params[:curtain][:wave_factor] != "" && params[:curtain][:fabric_width] != ""
			@number_items = @curtain.window_width / @curtain.window_number_parts
			@number_items = @number_items * @curtain.wave_factor
			@number_items = @number_items / @curtain.fabric_width

			@number_items = (@number_items).round

			@number_items = @number_items * @curtain.window_number_parts
			@number_items = @number_items * @curtain.window_height

			if (@number_items.ceil - @number_items) > 0.5
				@number_items = @number_items.to_i + 0.5
			else
				@number_items = @number_items.ceil
			end


			@budgets_product.quantity = @number_items
			@budgets_product.save

			@product = @budgets_product.product

		
			@budgets_product.computed_price = view_context.compute_price(
																					@product.product_type,
																					@product.supplier_price,
																					@product.ipi,
																					@product.markup,
																					@product.supplier_table_discount,
																					@budgets_product.quantity,
																					@budgets_product.freight,
																					@budgets_product.width,
																					@budgets_product.height,
																					@budgets_product.computed_price,
																					@budgets_product.up
																					)	

			@budgets_product.save
			
			if params[:curtain][:id] != ""
				@curtain.update_attributes!(params[:curtain])
			else
				@curtain.save!
			end


			respond_to do |format|
			  format.js
			end

		end

	end



	def update_products_list_show_hide
		
		@budget = Budget.find(params[:budget_id])
		@budgets_product = BudgetsProduct.find(params[:budget_product_id])

		@budgets_product.update_attributes!(show: params[:show])

		respond_to do |format|
    	format.html { redirect_to action: 'edit', id: @budget.id }
		end
	end



	def show_hidden_products

		@budget = Budget.find(params[:budget][:id])
		@budget.update_attributes!(show_hidden_products: params[:budget][:show_hidden_products])

		respond_to do |format|
    	format.html { redirect_to action: 'edit', id: @budget.id }
		end
	end


end
