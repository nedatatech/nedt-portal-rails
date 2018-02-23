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

def select_to_from
    render template: "payments/choose_type"
end

def store_to_from    
    pay_to = params[:to_from][:pay_to_type]
    pay_from = params[:to_from][:pay_from_type]
    redirect_to :controller => 'payments', :action => 'new', :pay_to_type => pay_to, :pay_from_type => pay_from
end
  # GET /payments/new
  def new
    @payment = Payment.new
    #@payment.build    
    #@payment
    #@employees_attributes = @payment.employee.build
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    #@payment.build_employee(payment_params)
    respond_to do |format|
      if @payment.save
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
      params.require(:payment).permit(:pay_to_id, :pay_to_type, :pay_from_id, :pay_from_type, :date, :amount, :reason)
    end

    def to_from_params
      params.require(:to_from).permit(:pay_to_type, :pay_from_type)
    end
end
