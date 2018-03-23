class TruckInventoriesController < ApplicationController
  before_action :set_truck_inventory, only: [:show, :edit, :update, :destroy]

  # GET /truck_inventories
  # GET /truck_inventories.json
  def index
    @truck_inventories = TruckInventory.all
  end

  # GET /truck_inventories/1
  # GET /truck_inventories/1.json
  def show
  end

  # GET /truck_inventories/new
  def new
    @truck_inventory = TruckInventory.new
  end

  # GET /truck_inventories/1/edit
  def edit
  end

  # POST /truck_inventories
  # POST /truck_inventories.json
  def create
    @truck_inventory = TruckInventory.new(truck_inventory_params)

    respond_to do |format|
      if @truck_inventory.save
        format.html { redirect_to @truck_inventory, notice: 'Truck inventory was successfully created.' }
        format.json { render :show, status: :created, location: @truck_inventory }
      else
        format.html { render :new }
        format.json { render json: @truck_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truck_inventories/1
  # PATCH/PUT /truck_inventories/1.json
  def update
    respond_to do |format|
      if @truck_inventory.update(truck_inventory_params)
        format.html { redirect_to @truck_inventory, notice: 'Truck inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck_inventory }
      else
        format.html { render :edit }
        format.json { render json: @truck_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck_inventories/1
  # DELETE /truck_inventories/1.json
  def destroy
    @truck_inventory.destroy
    respond_to do |format|
      format.html { redirect_to truck_inventories_url, notice: 'Truck inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_inventory
      @truck_inventory = TruckInventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_inventory_params
      params.require(:truck_inventory).permit(:truck_id, :inventory_item_id)
    end
end
