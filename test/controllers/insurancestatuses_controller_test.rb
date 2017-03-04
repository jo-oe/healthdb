require 'test_helper'

class InsurancestatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insurancestatus = insurancestatuses(:one)
  end

  test "should get index" do
    get insurancestatuses_url
    assert_response :success
  end

  test "should get new" do
    get new_insurancestatus_url
    assert_response :success
  end

  test "should create insurancestatus" do
    assert_difference('Insurancestatus.count') do
      post insurancestatuses_url, params: { insurancestatus: { code: @insurancestatus.code, text: @insurancestatus.text } }
    end

    assert_redirected_to insurancestatus_url(Insurancestatus.last)
  end

  test "should show insurancestatus" do
    get insurancestatus_url(@insurancestatus)
    assert_response :success
  end

  test "should get edit" do
    get edit_insurancestatus_url(@insurancestatus)
    assert_response :success
  end

  test "should update insurancestatus" do
    patch insurancestatus_url(@insurancestatus), params: { insurancestatus: { code: @insurancestatus.code, text: @insurancestatus.text } }
    assert_redirected_to insurancestatus_url(@insurancestatus)
  end

  test "should destroy insurancestatus" do
    assert_difference('Insurancestatus.count', -1) do
      delete insurancestatus_url(@insurancestatus)
    end

    assert_redirected_to insurancestatuses_url
  end
end
