require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url, as: :json
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { city: @client.city, cpf: @client.cpf, district: @client.district, name: @client.name, number: @client.number, phone1: @client.phone1, phone2: @client.phone2, rg: @client.rg, street: @client.street } }, as: :json
    end

    assert_response 201
  end

  test "should show client" do
    get client_url(@client), as: :json
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { city: @client.city, cpf: @client.cpf, district: @client.district, name: @client.name, number: @client.number, phone1: @client.phone1, phone2: @client.phone2, rg: @client.rg, street: @client.street } }, as: :json
    assert_response 200
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client), as: :json
    end

    assert_response 204
  end
end
