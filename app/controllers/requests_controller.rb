class RequestsController < ApplicationController


	def index

		@requests = Request.all

    respond_to do |format|
      format.html
    end
	end



	def create

		@request = Request.new
		@budget = Budget.find(params[:request][:budget_id])

    #returns the max report_number for the customer_id
    last_request = Request.where(budget_id: @budget.id).order('request_number DESC').first
    

    if last_request == nil
      request_number = @budget.id + 0.1
    else
      request_number = last_request.request_number + 0.1
    end

    @request.request_number = request_number
    
    @request.budget_id = @budget.id

		@request.save

 		@budget.budgets_products.each do |bp|

 			if bp.active && bp.request_id == nil

				bp.request_id = @request.id
				bp.save

			end

		end


    respond_to do |format|
      format.js
    end

	end




  def show
    @request = Request.find(params[:id])
    
    @budget = Budget.find(@request.budget_id)

    prawnto prawn: {page_size: "A4", page_layout: :landscape}, inline: true


    #respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @budget }
    #end
  end





	def destroy
		
		@request = Request.find(params[:id])

		@request.budgets_products.each do |bp|

			bp.request_id = nil
			bp.active = nil
			bp.save
		end


    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
	end


end
