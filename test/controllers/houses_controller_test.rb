require "test_helper"

class HousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    House.destroy_all
    @houses = House.create([
      {title: "Brisbane City", address: "1 Adelaide Street", image_url: "test.com"},
      {title: "New Farm", address: "1 New Farm Street", image_url: "test2.com"}
    ])
  end

  test "should get index" do
    get '/api/houses'
    assert_response :success
    assert @response.body, @houses.to_json
  end

  test "should get show" do
    get "/api/houses/#{@houses[0].id}"
    assert_response :success
    assert @response.body, @houses[0].to_json
  end

  test "should get create" do
    post '/api/houses', params: {title: "Fortitude Valley", address: "1 Fortitude Valley Street", image_url: "test3.com"}
    assert_response :success
    assert @response.body, @houses[2].to_json
  end

  test "should get update" do
    post "/api/sessions/sign_in", params: {email: 'test1', password: 'Passw0rd!'}
    token = JSON.parse(@response.body)[:authToken]

    put "/api/houses/#{@houses[0].id}", params: {title: "Teneriffe", address: "1 Teneriffe Street", image_url: "test4.com"}, headers: { Authorization: "Bearer #{token}"}
    assert_response :success
    assert @response.body, @houses[0].to_json({title: "Teneriffe", address: "1 Teneriffe Street", image_url: "test4.com"})
  end

  test "should get destroy" do
    post "/api/sessions/sign_in", params: {email: 'test1', password: 'Passw0rd!'}
    token = JSON.parse(@response.body)[:authToken]

    delete "/api/houses/#{@houses[0].id}", headers: { Authorization: "Bearer #{token}"}
    assert_response :success
    assert House.count, 1
  end
end
