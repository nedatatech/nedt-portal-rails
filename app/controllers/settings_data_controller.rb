class SettingsDataController < ApplicationController
  before_action :set_settings_datum, only: [:show, :edit, :update, :destroy]

  # GET /settings_data
  # GET /settings_data.json
  def index
    @settings_data = SettingsDatum.all
  end

  def settings        
    render template: "settings_data/settings"
  end 

  # GET /settings_data/1
  # GET /settings_data/1.json
  def show
  end

  # GET /settings_data/new
  def new
    @settings_datum = SettingsDatum.new
  end

  # GET /settings_data/1/edit
  def edit
  end

  # POST /settings_data
  # POST /settings_data.json
  def create
    @settings_datum = SettingsDatum.new(settings_datum_params)

    respond_to do |format|
      if @settings_datum.save
        format.html { redirect_to @settings_datum, notice: 'Settings datum was successfully created.' }
        format.json { render :show, status: :created, location: @settings_datum }
      else
        format.html { render :new }
        format.json { render json: @settings_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings_data/1
  # PATCH/PUT /settings_data/1.json
  def update
    respond_to do |format|
      if @settings_datum.update(settings_datum_params)
        format.html { redirect_to @settings_datum, notice: 'Settings datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @settings_datum }
      else
        format.html { render :edit }
        format.json { render json: @settings_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings_data/1
  # DELETE /settings_data/1.json
  def destroy
    @settings_datum.destroy
    respond_to do |format|
      format.html { redirect_to settings_data_url, notice: 'Settings datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_settings_datum
      @settings_datum = SettingsDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def settings_datum_params
      params.require(:settings_datum).permit(:name, :type, :description)
    end
end
