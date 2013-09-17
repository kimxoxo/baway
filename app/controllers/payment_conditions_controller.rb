class PaymentConditionsController < ApplicationController
  # GET /payment_conditions
  # GET /payment_conditions.json
  def index
    @payment_conditions = PaymentCondition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payment_conditions }
    end
  end

  # GET /payment_conditions/1
  # GET /payment_conditions/1.json
  def show
    @payment_condition = PaymentCondition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment_condition }
    end
  end

  # GET /payment_conditions/new
  # GET /payment_conditions/new.json
  def new
    @payment_condition = PaymentCondition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment_condition }
    end
  end

  # GET /payment_conditions/1/edit
  def edit
    @payment_condition = PaymentCondition.find(params[:id])
  end

  # POST /payment_conditions
  # POST /payment_conditions.json
  def create
    @payment_condition = PaymentCondition.new(params[:payment_condition])

    respond_to do |format|
      if @payment_condition.save
        format.html { redirect_to @payment_condition, notice: 'Payment condition was successfully created.' }
        format.json { render json: @payment_condition, status: :created, location: @payment_condition }
      else
        format.html { render action: "new" }
        format.json { render json: @payment_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payment_conditions/1
  # PUT /payment_conditions/1.json
  def update
    @payment_condition = PaymentCondition.find(params[:id])

    respond_to do |format|
      if @payment_condition.update_attributes(params[:payment_condition])
        format.html { redirect_to @payment_condition, notice: 'Payment condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_conditions/1
  # DELETE /payment_conditions/1.json
  def destroy
    @payment_condition = PaymentCondition.find(params[:id])
    @payment_condition.destroy

    respond_to do |format|
      format.html { redirect_to payment_conditions_url }
      format.json { head :no_content }
    end
  end
end
