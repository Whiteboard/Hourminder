require 'test_helper'

class StatusMessagesControllerTest < ActionController::TestCase
  setup do
    @status_message = status_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_message" do
    assert_difference('StatusMessage.count') do
      post :create, status_message: { status: @status_message.status, user_id: @status_message.user_id }
    end

    assert_redirected_to status_message_path(assigns(:status_message))
  end

  test "should show status_message" do
    get :show, id: @status_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_message
    assert_response :success
  end

  test "should update status_message" do
    patch :update, id: @status_message, status_message: { status: @status_message.status, user_id: @status_message.user_id }
    assert_redirected_to status_message_path(assigns(:status_message))
  end

  test "should destroy status_message" do
    assert_difference('StatusMessage.count', -1) do
      delete :destroy, id: @status_message
    end

    assert_redirected_to status_messages_path
  end
end
