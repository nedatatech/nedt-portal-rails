class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :set_order, only: [:pending]
  # GET /orders
  # GET /orders.json
  def index    
    @orders = Order.all
  end

  def pending
    @orders = Order.where(:order_status_id => 1)
    render :template => 'orders/pending'
  end

  def completed
    @orders = Order.where(:order_status_id => 2)
    render :template => 'orders/index'
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def build
    byebug
  end

  def receive
    @order = Order.find_by_id(params[:id])
    
    @order.order_items.each do |order_item|      
      @in_stock_item = InStockItem.where(:inventory_item_id => order_item.inventory_item_id).first      
      if @in_stock_item.present?        
        @in_stock_item.increment!(:item_quantity, order_item.quantity)
      else
        in_stock_item_params = {:inventory_item_id => order_item.inventory_item.id , :item_location_id => 3, :item_quantity => order_item.quantity, :notes => "Received from order"}
        @in_stock_item = InStockItem.new(in_stock_item_params) 
      end      
      #@in_stock_item = InStockItem.new(in_stock_item_params)
      if @in_stock_item.save 
      else
        format.html { render :new }
        format.json { render json: @in_stock_item.errors, status: :unprocessable_entity }        
      end 
    end
    @order.order_status_id = 2
    if @order.save 
    else
      format.html { render :new }
      format.json { render json: @order.errors, status: :unprocessable_entity }        
    end          
  end

  # GET /orders/new
  def new
    @order = Order.new
    #render "select_order"
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        session[:order_id] = @order.id
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:date, :vendor_id, :order_status_id)
    end
end
