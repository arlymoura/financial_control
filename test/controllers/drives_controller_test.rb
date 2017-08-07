require 'test_helper'

class DrivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drife = drives(:one)
  end

  test "should get index" do
    get drives_url, as: :json
    assert_response :success
  end

  test "should create drife" do
    assert_difference('Drive.count') do
      post drives_url, params: { drife: { client_id: @drife.client_id, name: @drife.name } }, as: :json
    end

    assert_response 201
  end

  test "should show drife" do
    get drife_url(@drife), as: :json
    assert_response :success
  end

  test "should update drife" do
    patch drife_url(@drife), params: { drife: { client_id: @drife.client_id, name: @drife.name } }, as: :json
    assert_response 200
  end

  test "should destroy drife" do
    assert_difference('Drive.count', -1) do
      delete drife_url(@drife), as: :json
    end

    assert_response 204
  end
end
