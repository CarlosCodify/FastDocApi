class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show update destroy ]

  # GET /api/v1/customers
  def index
    @customers = Customer.includes(:person).all

    render json: @customers.map { |m| custom_json(m) }
  end

  # GET /api/v1/customers/1
  def show
    render json: @customer.as_json(except: %i[created_at updated_at],
                                   include: [{ payments: { except: %i[created_at updated_at] } },
                                               except: %i[created_at updated_at] ])
  end

  # POST /api/v1/customers
  def create
    person = Person.create!(customer_params)
    @customer = Customer.create(person_id: person.id)
    debugger
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

    def custom_json(customer)
      customer_attrs = customer.attributes
      person_attrs = customer.person.attributes.except("id", "created_at", "updated_at")
      customer_attrs.merge(person_attrs)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer =Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :surname, :lastname, :phone, :email, :identity_document)
    end
end
