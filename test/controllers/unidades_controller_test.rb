require "test_helper"

class UnidadesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get unidades_index_url
    assert_response :success
  end

  test "should get show" do
    get unidades_show_url
    assert_response :success
  end

  test "should get new" do
    get unidades_new_url
    assert_response :success
  end

  test "should get create" do
    get unidades_create_url
    assert_response :success
  end

  test "should get edit" do
    get unidades_edit_url
    assert_response :success
  end

  test "should get update" do
    get unidades_update_url
    assert_response :success
  end

  test "should get destroy" do
    get unidades_destroy_url
    assert_response :success
  end
end
