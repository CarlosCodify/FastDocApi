class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show update destroy ]

  # GET /api/v1/customers
  def index
    @customers = Customer.all

    render json: @customers
  end

  # GET /api/v1/customers/1
  def show
    render json: @customer
  end

  # POST /api/v1/customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer =Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :surname, :lastname, :phone, :email, :identity_document)
    end
end
