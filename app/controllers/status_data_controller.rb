class StatusDataController < ApplicationController
  before_action :set_status_datum, only: [:show, :edit, :update, :destroy]
  #skip_before_action :authenticate_employee, :set_employee, only: [:create, :destroy]

  # GET /status_data
  # GET /status_data.json
  def index
    @status_data = StatusDatum.all
  end

  # GET /status_data/1
  # GET /status_data/1.json
  def show
  end

  # GET /status_data/new
  def new
    @status_datum = StatusDatum.new
  end

  # GET /status_data/1/edit
  def edit
  end

  # POST /status_data
  # POST /status_data.json
  def create
    @status_datum = StatusDatum.new(status_datum_params)

    respond_to do |format|
      if @status_datum.save
        format.html { redirect_to @status_datum, notice: 'Status datum was successfully created.' }
        format.json { render :show, status: :created, location: @status_datum }
      else
        format.html { render :new }
        format.json { render json: @status_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_data/1
  # PATCH/PUT /status_data/1.json
  def update
    respond_to do |format|
      if @status_datum.update(status_datum_params)
        format.html { redirect_to @status_datum, notice: 'Status datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_datum }
      else
        format.html { render :edit }
        format.json { render json: @status_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_data/1
  # DELETE /status_data/1.json
  def destroy
    @status_datum.destroy
    respond_to do |format|
      format.html { redirect_to status_data_url, notice: 'Status datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_datum
      @status_datum = StatusDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_datum_params
      params.require(:status_datum).permit(:name, :description)
    end
end
