require "test_helper"

class SetoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get setores_index_url
    assert_response :success
  end

  test "should get show" do
    get setores_show_url
    assert_response :success
  end

  test "should get new" do
    get setores_new_url
    assert_response :success
  end

  test "should get create" do
    get setores_create_url
    assert_response :success
  end

  test "should get edit" do
    get setores_edit_url
    assert_response :success
  end

  test "should get update" do
    get setores_update_url
    assert_response :success
  end

  test "should get destroy" do
    get setores_destroy_url
    assert_response :success
  end
end
