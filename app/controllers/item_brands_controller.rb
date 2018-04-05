class ItemBrandsController < ApplicationController
  before_action :set_item_brand, only: [:show, :edit, :update, :destroy]

  # GET /item_brands
  # GET /item_brands.json
  def index
    @item_brands = ItemBrand.all
  end

  # GET /item_brands/1
  # GET /item_brands/1.json
  def show
  end

  # GET /item_brands/new
  def new
    @item_brand = ItemBrand.new
  end

  # GET /item_brands/1/edit
  def edit
  end

  # POST /item_brands
  # POST /item_brands.json
  def create
    @item_brand = ItemBrand.new(item_brand_params)

    respond_to do |format|
      if @item_brand.save
        format.html { redirect_to @item_brand, notice: 'Item brand was successfully created.' }
        format.json { render :show, status: :created, location: @item_brand }
      else
        format.html { render :new }
        format.json { render json: @item_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_brands/1
  # PATCH/PUT /item_brands/1.json
  def update
    respond_to do |format|
      if @item_brand.update(item_brand_params)
        format.html { redirect_to @item_brand, notice: 'Item brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_brand }
      else
        format.html { render :edit }
        format.json { render json: @item_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_brands/1
  # DELETE /item_brands/1.json
  def destroy
    @item_brand.destroy
    respond_to do |format|
      format.html { redirect_to item_brands_url, notice: 'Item brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_brand
      @item_brand = ItemBrand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_brand_params
      params.require(:item_brand).permit(:name, :description)
    end
end
