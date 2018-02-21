class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new    
    byebug
    @payment_to_from_attributes = @payment.payment_to_froms.build

  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    #byebug
    @payment = Payment.new(payment_params)            
    #@payment_to_froms = Payment_to_froms.new
    #@payment_to_froms =     
    @payment.payment_to_froms.create!({:pay_to_id => params[:pay_to_id], :pay_to_type => "customer", :pay_from_id => params[:pay_from_id], :pay_from_type => "customer"})
    #@payment_info = {pay_to_type: "customer", pay_to_id: payment_params[pay_to_id], pay_from_type: "customer", pay_from_id: payment_params[pay_from_id] }    
 #   @payment_to_from = Payment_to_from.new(payment_params)
#byebug
    respond_to do |format|
      if @payment.save          
        byebug       

        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:pay_date, :type_id, :status_id, :amount, :reason)
    end
end
