require 'test_helper'

class BotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bot = bots(:one)
  end

  test "should get index" do
    get bots_url, as: :json
    assert_response :success
  end

  test "should create bot" do
    assert_difference('Bot.count') do
      post bots_url, params: { bot: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show bot" do
    get bot_url(@bot), as: :json
    assert_response :success
  end

  test "should update bot" do
    patch bot_url(@bot), params: { bot: {  } }, as: :json
    assert_response 200
  end

  test "should destroy bot" do
    assert_difference('Bot.count', -1) do
      delete bot_url(@bot), as: :json
    end

    assert_response 204
  end
end
