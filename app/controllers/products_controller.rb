class ProductsController < ApplicationController


	def import
	  
	  Product.import(params[:file])
	  
	  redirect_to products_path, notice: "Products imported."
	end





  # GET /products
  # GET /products.json
  def index


   	@products = Product.paginate(page: params[:page], per_page: 10).order('created_at DESC')


    if params[:product]
	    ##query for code
	    @products_search_list1 = Product.where(supplier_id: params[:product][:supplier_id], visible: true).where("lower(code) LIKE ? ", "#{params[:product][:search_phrase].downcase}%")
	    ##query for description
	    @products_search_list2 = Product.where(supplier_id: params[:product][:supplier_id], visible: true).where("lower(description) LIKE ?", "%#{params[:product][:search_phrase].downcase}%")

	    ##merge results
			@products = (@products_search_list1 + @products_search_list2).uniq

			@products = @products.paginate(page: params[:page], per_page: 10)
    end


    @product = Product.new

    @suppliers = Supplier.order('name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

end
