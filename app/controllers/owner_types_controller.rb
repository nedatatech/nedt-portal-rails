class OwnerTypesController < ApplicationController
  before_action :set_owner_type, only: [:show, :edit, :update, :destroy]

  # GET /owner_types
  # GET /owner_types.json
  def index
    @owner_types = OwnerType.all
  end

  # GET /owner_types/1
  # GET /owner_types/1.json
  def show
  end

  # GET /owner_types/new
  def new
    @owner_type = OwnerType.new
  end

  # GET /owner_types/1/edit
  def edit
  end

  # POST /owner_types
  # POST /owner_types.json
  def create
    @owner_type = OwnerType.new(owner_type_params)

    respond_to do |format|
      if @owner_type.save
        format.html { redirect_to @owner_type, notice: 'Owner type was successfully created.' }
        format.json { render :show, status: :created, location: @owner_type }
      else
        format.html { render :new }
        format.json { render json: @owner_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owner_types/1
  # PATCH/PUT /owner_types/1.json
  def update
    respond_to do |format|
      if @owner_type.update(owner_type_params)
        format.html { redirect_to @owner_type, notice: 'Owner type was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner_type }
      else
        format.html { render :edit }
        format.json { render json: @owner_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owner_types/1
  # DELETE /owner_types/1.json
  def destroy
    @owner_type.destroy
    respond_to do |format|
      format.html { redirect_to owner_types_url, notice: 'Owner type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner_type
      @owner_type = OwnerType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_type_params
      params.require(:owner_type).permit(:name, :description)
    end
end
