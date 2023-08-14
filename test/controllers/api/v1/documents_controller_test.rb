require "test_helper"

class Api::V1::DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_document = api_v1_documents(:one)
  end

  test "should get index" do
    get api_v1_documents_url, as: :json
    assert_response :success
  end

  test "should create api_v1_document" do
    assert_difference("Api::V1::Document.count") do
      post api_v1_documents_url, params: { api_v1_document: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_document" do
    get api_v1_document_url(@api_v1_document), as: :json
    assert_response :success
  end

  test "should update api_v1_document" do
    patch api_v1_document_url(@api_v1_document), params: { api_v1_document: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_document" do
    assert_difference("Api::V1::Document.count", -1) do
      delete api_v1_document_url(@api_v1_document), as: :json
    end

    assert_response :no_content
  end
end
