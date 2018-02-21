class PaymentToFromsController < ApplicationController
  before_action :set_payment_to_from, only: [:show, :edit, :update, :destroy]

  # GET /payment_to_froms
  # GET /payment_to_froms.json
  def index
    @payment_to_froms = PaymentToFrom.all
  end

  # GET /payment_to_froms/1
  # GET /payment_to_froms/1.json
  def show
  end

  # GET /payment_to_froms/new
  def new
    @payment_to_from = PaymentToFrom.new
  end

  # GET /payment_to_froms/1/edit
  def edit
  end

  # POST /payment_to_froms
  # POST /payment_to_froms.json
  def create
    byebug
    @payment_to_from = PaymentToFrom.new(payment_to_from_params)

    respond_to do |format|
      if @payment_to_from.save
        format.html { redirect_to @payment_to_from, notice: 'Payment to from was successfully created.' }
        format.json { render :show, status: :created, location: @payment_to_from }
      else
        format.html { render :new }
        format.json { render json: @payment_to_from.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_to_froms/1
  # PATCH/PUT /payment_to_froms/1.json
  def update
    respond_to do |format|
      if @payment_to_from.update(payment_to_from_params)
        format.html { redirect_to @payment_to_from, notice: 'Payment to from was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_to_from }
      else
        format.html { render :edit }
        format.json { render json: @payment_to_from.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_to_froms/1
  # DELETE /payment_to_froms/1.json
  def destroy
    @payment_to_from.destroy
    respond_to do |format|
      format.html { redirect_to payment_to_froms_url, notice: 'Payment to from was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_to_from
      @payment_to_from = PaymentToFrom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_to_from_params
      params.require(:payment_to_from).permit(:pay_to_id, :pay_from_id)
    end
end
