class BusLocationsController < ApplicationController
  before_action :set_bus_location, only: [:show, :edit, :update, :destroy]

  # GET /bus_locations
  # GET /bus_locations.json
  def index
    @bus_locations = BusLocation.all.order(:created_at => :desc).group_by{|c| c.vehicle.code}
  end

  # GET /bus_locations/1
  # GET /bus_locations/1.json
  def show
  end

  # GET /bus_locations/new
  def new
    @bus_location = BusLocation.new
  end

  # GET /bus_locations/1/edit
  def edit
  end

  # POST /bus_locations
  # POST /bus_locations.json
  def create
    @bus_location = BusLocation.new(bus_location_params)

    respond_to do |format|
      if @bus_location.save
        format.html { redirect_to @bus_location, notice: 'Bus location was successfully created.' }
        format.json { render :show, status: :created, location: @bus_location }
      else
        format.html { render :new }
        format.json { render json: @bus_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_locations/1
  # PATCH/PUT /bus_locations/1.json
  def update
    respond_to do |format|
      if @bus_location.update(bus_location_params)
        format.html { redirect_to @bus_location, notice: 'Bus location was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_location }
      else
        format.html { render :edit }
        format.json { render json: @bus_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_locations/1
  # DELETE /bus_locations/1.json
  def destroy
    @bus_location.destroy
    respond_to do |format|
      format.html { redirect_to bus_locations_url, notice: 'Bus location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_location
      @bus_location = BusLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_location_params
      params.require(:bus_location).permit(:bus_stop_id, :bus_route_id, :vehicle_id, :latitude, :longitude, :arrived)
    end
end
