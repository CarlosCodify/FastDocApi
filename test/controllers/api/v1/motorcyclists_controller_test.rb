require "test_helper"

class Api::V1::MotorcyclistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_motorcyclist = api_v1_motorcyclists(:one)
  end

  test "should get index" do
    get api_v1_motorcyclists_url, as: :json
    assert_response :success
  end

  test "should create api_v1_motorcyclist" do
    assert_difference("Api::V1::Motorcyclist.count") do
      post api_v1_motorcyclists_url, params: { api_v1_motorcyclist: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_motorcyclist" do
    get api_v1_motorcyclist_url(@api_v1_motorcyclist), as: :json
    assert_response :success
  end

  test "should update api_v1_motorcyclist" do
    patch api_v1_motorcyclist_url(@api_v1_motorcyclist), params: { api_v1_motorcyclist: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_motorcyclist" do
    assert_difference("Api::V1::Motorcyclist.count", -1) do
      delete api_v1_motorcyclist_url(@api_v1_motorcyclist), as: :json
    end

    assert_response :no_content
  end
end
