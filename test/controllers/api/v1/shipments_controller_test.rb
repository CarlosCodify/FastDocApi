require "test_helper"

class Api::V1::ShipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_shipment = api_v1_shipments(:one)
  end

  test "should get index" do
    get api_v1_shipments_url, as: :json
    assert_response :success
  end

  test "should create api_v1_shipment" do
    assert_difference("Api::V1::Shipment.count") do
      post api_v1_shipments_url, params: { api_v1_shipment: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_shipment" do
    get api_v1_shipment_url(@api_v1_shipment), as: :json
    assert_response :success
  end

  test "should update api_v1_shipment" do
    patch api_v1_shipment_url(@api_v1_shipment), params: { api_v1_shipment: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_shipment" do
    assert_difference("Api::V1::Shipment.count", -1) do
      delete api_v1_shipment_url(@api_v1_shipment), as: :json
    end

    assert_response :no_content
  end
end
