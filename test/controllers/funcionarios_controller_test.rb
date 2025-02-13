require "test_helper"

class FuncionariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get funcionarios_index_url
    assert_response :success
  end

  test "should get show" do
    get funcionarios_show_url
    assert_response :success
  end

  test "should get new" do
    get funcionarios_new_url
    assert_response :success
  end

  test "should get create" do
    get funcionarios_create_url
    assert_response :success
  end

  test "should get edit" do
    get funcionarios_edit_url
    assert_response :success
  end

  test "should get update" do
    get funcionarios_update_url
    assert_response :success
  end

  test "should get destroy" do
    get funcionarios_destroy_url
    assert_response :success
  end
end
