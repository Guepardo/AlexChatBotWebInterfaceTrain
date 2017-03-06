require 'test_helper'

class DialogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dialog = dialogs(:one)
  end

  test "should get index" do
    get dialogs_url, as: :json
    assert_response :success
  end

  test "should create dialog" do
    assert_difference('Dialog.count') do
      post dialogs_url, params: { dialog: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show dialog" do
    get dialog_url(@dialog), as: :json
    assert_response :success
  end

  test "should update dialog" do
    patch dialog_url(@dialog), params: { dialog: {  } }, as: :json
    assert_response 200
  end

  test "should destroy dialog" do
    assert_difference('Dialog.count', -1) do
      delete dialog_url(@dialog), as: :json
    end

    assert_response 204
  end
end
