require "test_helper"

class VisitasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get visitas_index_url
    assert_response :success
  end

  test "should get show" do
    get visitas_show_url
    assert_response :success
  end

  test "should get new" do
    get visitas_new_url
    assert_response :success
  end

  test "should get create" do
    get visitas_create_url
    assert_response :success
  end

  test "should get edit" do
    get visitas_edit_url
    assert_response :success
  end

  test "should get update" do
    get visitas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get visitas_destroy_url
    assert_response :success
  end
end
