class InventoryController < ApplicationController

 def new

 end

def receive
  @inventory_item = InventoryItem.new
  @inventory_items = InventoryItem.joins(:item_status).where(:item_statuses => {:name => "On Order"})

  render "/inventory/receive"
end

def order
  @inventory_item = InventoryItem.new
  render "/inventory/order"
end 

def select_location	
  #params[:inventory_item][:id] = params[:inventory_item_id]
  @item_location = ItemLocation.new
  @item_locations = ItemLocation.joins(:truck).where(:trucks => {:id => params[:truck][:id]})     
end

def list_items    
  @inventory_item = InventoryItem.new
  @inventory_items = InventoryItem.joins(:item_status).where(:item_statuses => {:name => "Received"})
  
  render "/inventory/list_items"
end

def select_truck
  @truck = Truck.new
  #@inventory_items = InventoryItem.joins(:item_status).where(:item_statuses => {:name => "Received"})  
  render "/inventory/select_truck"
end

  def move_to_truck    
   # @inventory_item = InventoryItem.new
    @inventory_item = InventoryItem.find(params[:inventory_item_id])
    respond_to do |format|
      if @inventory_item.update(:item_status_id => 1, :item_location_id => 1)
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully moved to truck' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end        
  end

private
  def inventory_params
    params.require(:inventory).permit(:inventory_item_id)
  end
end
