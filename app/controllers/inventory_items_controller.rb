class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy, :receive]
  skip_before_action :set_inventory_item, only: [:move_to_truck]

  # GET /inventory_items
  # GET /inventory_items.json
  def index
    @inventory_items = InventoryItem.all
  end

  # GET /inventory_items/1
  # GET /inventory_items/1.json
  def show
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new
  end

  # POST /inventory_items/1
  # POST /inventory_items/1
  def receive    
    @inventory_item.update(:item_status_id => 3, :item_location_id => 4)

    respond_to do |format|
      if @inventory_item.update(:item_status_id => 3)
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully marked as received.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end    
  end
  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  # POST /inventory_items.json
  def create    

   ## @test = params[:inventory_item][:quantity].to_i
   ## @test.times do 
   ##   byebug
   ## end 

    @inventory_item = InventoryItem.new(inventory_item_params)

    #On Order
    #@inventory_item.item_status_id = 2

    #Vendor
    #@inventory_item.item_location_id = 5
    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_items/1
  # PATCH/PUT /inventory_items/1.json
  def update    
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_items/1
  # DELETE /inventory_items/1.json
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_items_url, notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_item_params
      params.require(:inventory_item).permit(:item_brand_id, :item_type_id, :item_location_id, :item_size_id, :item_status_id, :item_notes, :cost, :retail, :markup, :price)
    end
end
