class  Api::V1::DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show update destroy ]

  # GET /api/v1/documents
  def index
    @documents = Document.all

    render json: @documents
  end

  # GET /api/v1/documents/1
  def show
    render json: @document
  end

  # POST /api/v1/documents
  def create
    @document = Document.new(document_params)

    if @document.save
      render json: @document, status: :created
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/documents/1
  def update
    if @document.update(document_params)
      render json: @document
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/documents/1
  def destroy
    @document.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:content, :document_type_id)
    end
end
