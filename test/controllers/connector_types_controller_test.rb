require 'test_helper'

class ConnectorTypesControllerTest < ActionController::TestCase
  setup do
    @connector_type = connector_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:connector_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create connector_type" do
    assert_difference('ConnectorType.count') do
      post :create, connector_type: { name: @connector_type.name }
    end

    assert_redirected_to connector_type_path(assigns(:connector_type))
  end

  test "should show connector_type" do
    get :show, id: @connector_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @connector_type
    assert_response :success
  end

  test "should update connector_type" do
    patch :update, id: @connector_type, connector_type: { name: @connector_type.name }
    assert_redirected_to connector_type_path(assigns(:connector_type))
  end

  test "should destroy connector_type" do
    assert_difference('ConnectorType.count', -1) do
      delete :destroy, id: @connector_type
    end

    assert_redirected_to connector_types_path
  end
end
