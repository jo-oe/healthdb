require 'test_helper'

class HomeplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homeplace = homeplaces(:one)
  end

  test "should get index" do
    get homeplaces_url
    assert_response :success
  end

  test "should get new" do
    get new_homeplace_url
    assert_response :success
  end

  test "should create homeplace" do
    assert_difference('Homeplace.count') do
      post homeplaces_url, params: { homeplace: { code: @homeplace.code, text: @homeplace.text } }
    end

    assert_redirected_to homeplace_url(Homeplace.last)
  end

  test "should show homeplace" do
    get homeplace_url(@homeplace)
    assert_response :success
  end

  test "should get edit" do
    get edit_homeplace_url(@homeplace)
    assert_response :success
  end

  test "should update homeplace" do
    patch homeplace_url(@homeplace), params: { homeplace: { code: @homeplace.code, text: @homeplace.text } }
    assert_redirected_to homeplace_url(@homeplace)
  end

  test "should destroy homeplace" do
    assert_difference('Homeplace.count', -1) do
      delete homeplace_url(@homeplace)
    end

    assert_redirected_to homeplaces_url
  end
end
