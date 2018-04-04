class InStockItemsController < ApplicationController
  before_action :set_in_stock_item, only: [:show, :edit, :update, :destroy]

  # GET /in_stock_items
  # GET /in_stock_items.json
  def index
    @in_stock_items = InStockItem.all
  end

  # GET /in_stock_items/1
  # GET /in_stock_items/1.json
  def show
  end

  # GET /in_stock_items/new
  def new
    @in_stock_item = InStockItem.new
  end

  # GET /in_stock_items/1/edit
  def edit
  end

  # POST /in_stock_items
  # POST /in_stock_items.json
  def create
    @in_stock_item = InStockItem.new(in_stock_item_params)

    respond_to do |format|
      if @in_stock_item.save
        format.html { redirect_to @in_stock_item, notice: 'In stock item was successfully created.' }
        format.json { render :show, status: :created, location: @in_stock_item }
      else
        format.html { render :new }
        format.json { render json: @in_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_stock_items/1
  # PATCH/PUT /in_stock_items/1.json
  def update
    respond_to do |format|
      if @in_stock_item.update(in_stock_item_params)
        format.html { redirect_to @in_stock_item, notice: 'In stock item was successfully updated.' }
        format.json { render :show, status: :ok, location: @in_stock_item }
      else
        format.html { render :edit }
        format.json { render json: @in_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_stock_items/1
  # DELETE /in_stock_items/1.json
  def destroy
    @in_stock_item.destroy
    respond_to do |format|
      format.html { redirect_to in_stock_items_url, notice: 'In stock item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_stock_item
      @in_stock_item = InStockItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_stock_item_params
      params.require(:in_stock_item).permit(:inventory_item_id, :item_location_id, :item_quantity, :notes)
    end
end
