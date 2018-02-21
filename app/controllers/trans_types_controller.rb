class TransTypesController < ApplicationController
  before_action :set_trans_type, only: [:show, :edit, :update, :destroy]

  # GET /trans_types
  # GET /trans_types.json
  def index
    @trans_types = TransType.all
  end

  # GET /trans_types/1
  # GET /trans_types/1.json
  def show
  end

  # GET /trans_types/new
  def new
    @trans_type = TransType.new
  end

  # GET /trans_types/1/edit
  def edit
  end

  # POST /trans_types
  # POST /trans_types.json
  def create
    @trans_type = TransType.new(trans_type_params)

    respond_to do |format|
      if @trans_type.save
        format.html { redirect_to @trans_type, notice: 'Trans type was successfully created.' }
        format.json { render :show, status: :created, location: @trans_type }
      else
        format.html { render :new }
        format.json { render json: @trans_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trans_types/1
  # PATCH/PUT /trans_types/1.json
  def update
    respond_to do |format|
      if @trans_type.update(trans_type_params)
        format.html { redirect_to @trans_type, notice: 'Trans type was successfully updated.' }
        format.json { render :show, status: :ok, location: @trans_type }
      else
        format.html { render :edit }
        format.json { render json: @trans_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trans_types/1
  # DELETE /trans_types/1.json
  def destroy
    @trans_type.destroy
    respond_to do |format|
      format.html { redirect_to trans_types_url, notice: 'Trans type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trans_type
      @trans_type = TransType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trans_type_params
      params.require(:trans_type).permit(:name, :description)
    end
end
