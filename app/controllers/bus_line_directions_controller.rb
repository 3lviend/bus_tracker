class BusLineDirectionsController < ApplicationController
  before_action :set_bus_line_direction, only: [:show, :edit, :update, :destroy]

  # GET /bus_line_directions
  # GET /bus_line_directions.json
  def index
    @bus_line_directions = BusLineDirection.all
  end

  # GET /bus_line_directions/1
  # GET /bus_line_directions/1.json
  def show
  end

  # GET /bus_line_directions/new
  def new
    @bus_line_direction = BusLineDirection.new
  end

  # GET /bus_line_directions/1/edit
  def edit
  end

  # POST /bus_line_directions
  # POST /bus_line_directions.json
  def create
    @bus_line_direction = BusLineDirection.new(bus_line_direction_params)

    respond_to do |format|
      if @bus_line_direction.save
        format.html { redirect_to @bus_line_direction, notice: 'Bus line direction was successfully created.' }
        format.json { render :show, status: :created, location: @bus_line_direction }
      else
        format.html { render :new }
        format.json { render json: @bus_line_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_line_directions/1
  # PATCH/PUT /bus_line_directions/1.json
  def update
    respond_to do |format|
      if @bus_line_direction.update(bus_line_direction_params)
        format.html { redirect_to @bus_line_direction, notice: 'Bus line direction was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_line_direction }
      else
        format.html { render :edit }
        format.json { render json: @bus_line_direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_line_directions/1
  # DELETE /bus_line_directions/1.json
  def destroy
    @bus_line_direction.destroy
    respond_to do |format|
      format.html { redirect_to bus_line_directions_url, notice: 'Bus line direction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_line_direction
      @bus_line_direction = BusLineDirection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_line_direction_params
      params.require(:bus_line_direction).permit(:display_name, :bus_route_id, :direction_name, :code)
    end
end
