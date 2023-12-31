class Api::V1::MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: %i[ show update destroy ]
  before_action :set_motorcyclist, only: %i[ index create ]

  # GET /api/v1/motorcycles
  def index
    @motorcycles = @motorcyclist.motorcycles

    render json: @motorcycles
  end

  # GET /api/v1/motorcycles/1
  def show
    render json: @motorcycle
  end

  # POST /api/v1/motorcycles
  def create
    @motorcycle = @motorcyclist.motorcycles.build(motorcycle_params)

    if @motorcycle.save
      render json: @motorcycle, status: :created
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/motorcycles/1
  def update
    if @motorcycle.update(motorcycle_params)
      render json: @motorcycle
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/motorcycles/1
  def destroy
    @motorcycle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorcycle
      @motorcycle = Motorcycle.find(params[:id])
    end

    def set_motorcyclist
      @motorcyclist = Motorcyclist.find(params[:motorcyclist_id])
    end

    # Only allow a list of trusted parameters through.
    def motorcycle_params
      params.require(:motorcycle).permit(:model, :license_plate, :active, :motorcyclist_id)
    end
end
