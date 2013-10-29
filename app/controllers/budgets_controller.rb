class BudgetsController < ApplicationController
  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budgets }
    end
  end





  # GET /budgets/1
  # GET /budgets/1.json
  def show
    @budget = Budget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @budget }
    end
  end




  def products_search

    #view_context to include the function from aplication helper
    if view_context.is_numeric?(params[:product][:search_phrase])
      @products_search_list = Product.where("code LIKE ?", "#{params[:product][:search_phrase]}%")
    else
      @products_search_list = Product.where("lower(description) LIKE ?", "%#{params[:product][:search_phrase]}%")
    end

    @budget = Budget.find(params[:product][:budget_id])

    respond_to do |format|
      format.js
    end        
  end



  def update_products_list
    @budget  = Budget.find(params[:budget_id])
    @product = Product.find(params[:product_id])



    #delete product from budget list
    if params[:delete]
      @budget.products.find(@product.id).destroy      

      flash.now[:notice] = (t :"flash_messages.removed_product_from_the_list_successfully")

    #else if not params[:delete]
    else

      #if the product already in the list, display a message
      if @budget.products.find_by_id(params[:product_id])

        flash.now[:error] = (t :"flash_messages.adding_existing_product_to_budget_list")

      #if the procuct does not exist for that budget, then save and follow the "regular" track
      else
        @product.budgets << @budget

        flash.now[:success] = (t :"flash_messages.added_product_to_budget_list_successfully")  
      end
    end

    respond_to do |format|
      format.js
    end
  end



  def update_product_attributes

    @budgetsproduct = BudgetsProduct.find(params[:budgets_product][:id])

    @budgetsproduct.update_attributes(params[:budgets_product])

    respond_to do |format|
      format.js
    end
  end


  # GET /budgets/new
  # GET /budgets/new.json
  def new
    @budget = Budget.new
    @customer = Customer.new



    #if params[:budget]
      #@customer = Customer.find_by_tax_number(params[:budget][:customer_attributes][:tax_number])
    #end

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
    @products = @budget.products.order('created_at DESC')
    @products_search_list = []
  end


  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(params[:budget])

    #@customer = Customer.new(params[:budget][:customer_attributes])
    #@customer.save!

    respond_to do |format|
      if @budget.save
        #format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.html { redirect_to action: 'edit', id: @budget.id }
        format.json { render json: @budget, status: :created, location: @budget }
      else
        format.html { render action: "new" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end







  # PUT /budgets/1
  # PUT /budgets/1.json
  def update
    @budget = Budget.find(params[:id])

    respond_to do |format|
      if @budget.update_attributes(params[:budget])
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end






  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to budgets_url }
      format.json { head :no_content }
    end
  end
end
