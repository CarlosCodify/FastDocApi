class Api::V1::ShipmentsController < ApplicationController
  before_action :set_shipment, except: %i[index create]

  # GET /api/v1/shipments
  def index
    @shipments = Shipment.all.includes(:shipment_status, :motorcyclist, :pickup_location, :delivery_location)

    render json: @shipments.as_json(include: [ :shipment_status, :motorcyclist, :pickup_location, :delivery_location ])
  end

  # GET /api/v1/shipments/1
  def show
    render json: @shipment
  end

  # POST /api/v1/shipments
  def create
    @shipment = Shipment.new(shipment_params)
    @shipment.shipment_status_id = ShipmentStatus.find_by(description: 'Pendiente').id
    @shipment.request_date = DateTime.now

    if @shipment.save
      render json: @shipment, status: :created
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/shipments/1
  def update
    if @shipment.update(shipment_params)
      render json: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/shipments/1
  def destroy
    @shipment.destroy
  end

  # Asignar un motociclista al envío
  def assign_motorcyclist
    @shipment.shipment_status_id = ShipmentStatus.find_by(description: 'Pendiente').id
    if @shipment.update(motorcyclist_id: params[:motorcyclist_id])
      render json: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  # Iniciar la entrega
  def start_delivery
    @shipment.shipment_status_id = ShipmentStatus.find_by(description: 'En camino').id
    if @shipment.save
      render json: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  # Completar la entrega
  def complete_delivery
    @shipment.shipment_status_id = ShipmentStatus.find_by(description: 'Entregado').id
    @shipment.delivery_date = DateTime.now
    if @shipment.save
      render json: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  def register_sender_payment
    @payment = @shipment.build_payment(payment_params)
    if @payment.save
      render json: @shipment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  def register_receiver_payment
    @payment = @shipment.build_payment(payment_params)
    if @payment.save
      render json: @shipment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipment_params
      params.require(:shipment).permit(:request_date, :document_id, :sender_customer_id, :receiver_customer_id, :pickup_location_id, :delivery_location_id, :motorcyclist_id)
    end

    def payment_params
      params.require(:payment).permit(:amount, :payment_date, :payer_type, :payer_id)
    end
end
