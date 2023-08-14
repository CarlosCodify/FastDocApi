class Api::V1::MotorcyclistsController < ApplicationController
  before_action :set_motorcyclist, only: %i[ show update destroy ]

  # GET /api/v1/motorcyclists
  def index
    @motorcyclists = Motorcyclist.all

    render json: @motorcyclists
  end

  # GET /api/v1/motorcyclists/1
  def show
    render json: @motorcyclist
  end

  # POST /api/v1/motorcyclists
  def create
    @motorcyclist = Motorcyclist.new(motorcyclist_params)

    if @motorcyclist.save
      render json: @motorcyclist, status: :created
    else
      render json: @motorcyclist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/motorcyclists/1
  def update
    if @motorcyclist.update(motorcyclist_params)
      render json: @motorcyclist
    else
      render json: @motorcyclist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/motorcyclists/1
  def destroy
    @motorcyclist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorcyclist
      @motorcyclist = Motorcyclist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def motorcyclist_params
      params.require(:motorcyclist).permit(:name, :surname, :lastname, :phone, :email, :identity_document)
    end
end
