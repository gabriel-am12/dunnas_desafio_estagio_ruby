require "test_helper"

class VisitantesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get visitantes_index_url
    assert_response :success
  end

  test "should get show" do
    get visitantes_show_url
    assert_response :success
  end

  test "should get new" do
    get visitantes_new_url
    assert_response :success
  end

  test "should get create" do
    get visitantes_create_url
    assert_response :success
  end

  test "should get edit" do
    get visitantes_edit_url
    assert_response :success
  end

  test "should get update" do
    get visitantes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get visitantes_destroy_url
    assert_response :success
  end
end
