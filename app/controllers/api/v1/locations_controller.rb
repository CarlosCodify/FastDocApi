class Api::V1::LocationsController < ApplicationController
  before_action :set_location, only: %i[ show update destroy ]
  before_action :set_customer, only: %i[ index create ]

  # GET /api/v1/locations
  def index
    @locations = @customer.locations

    render json: @locations
  end

  # GET /api/v1/locations/1
  def show
    render json: @location
  end

  # POST /api/v1/locations
  def create
    @location = @customer.locations.build(location_params)

    if @location.save
      render json: @location, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/locations/1
  def destroy
    @location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:latitude, :longitude, :description)
    end
end
