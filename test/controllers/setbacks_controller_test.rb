require 'test_helper'

class SetbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get setbacks_new_url
    assert_response :success
  end

  test "should get edit" do
    get setbacks_edit_url
    assert_response :success
  end

  test "should get show" do
    get setbacks_show_url
    assert_response :success
  end

end
