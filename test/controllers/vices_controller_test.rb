require 'test_helper'

class VicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vices_index_url
    assert_response :success
  end

  test "should get new" do
    get vices_new_url
    assert_response :success
  end

  test "should get create" do
    get vices_create_url
    assert_response :success
  end

  test "should get destroy" do
    get vices_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get vices_edit_url
    assert_response :success
  end

  test "should get show" do
    get vices_show_url
    assert_response :success
  end

end
