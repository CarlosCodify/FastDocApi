class Api::V1::MotorcyclistsController < ApplicationController
  before_action :set_motorcyclist, only: %i[ show update destroy ]

  # GET /api/v1/motorcyclists
  def index
    @motorcyclists = Motorcyclist.includes(:person, :motorcycles).all

    render json: @motorcyclists.map { |m| custom_json(m) }
  end

  # GET /api/v1/motorcyclists/1
  def show
    render json: @motorcyclist
  end

  # POST /api/v1/motorcyclists
  def create
    person = Person.create!(motorcyclist_params)

    @motorcyclist = Motorcyclist.create(person_id: person.id)

    if @motorcyclist.save
      render json: @motorcyclist, status: :created
    else
      render json: @motorcyclist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/motorcyclists/1
  def update
    if @motorcyclist.person.update(motorcyclist_params)
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

    def custom_json(motorcyclist)
      motorcyclist_attrs = motorcyclist.attributes
      person_attrs = motorcyclist.person.attributes.except("id", "created_at", "updated_at")
      motorcycles = motorcyclist.motorcycles.map do |motorcycle|
        motorcycle.attributes.except("created_at", "updated_at")
      end
      motorcyclist_attrs.merge(person_attrs).merge(motorcycles: motorcycles)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_motorcyclist
      @motorcyclist = Motorcyclist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def motorcyclist_params
      params.require(:motorcyclist).permit(:name, :surname, :lastname, :phone, :email, :identity_document)
    end
end
