require 'test_helper'

class IntentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intent = intents(:one)
  end

  test "should get index" do
    get intents_url, as: :json
    assert_response :success
  end

  test "should create intent" do
    assert_difference('Intent.count') do
      post intents_url, params: { intent: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show intent" do
    get intent_url(@intent), as: :json
    assert_response :success
  end

  test "should update intent" do
    patch intent_url(@intent), params: { intent: {  } }, as: :json
    assert_response 200
  end

  test "should destroy intent" do
    assert_difference('Intent.count', -1) do
      delete intent_url(@intent), as: :json
    end

    assert_response 204
  end
end
