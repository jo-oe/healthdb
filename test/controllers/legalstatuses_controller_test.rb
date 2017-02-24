require 'test_helper'

class LegalstatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legalstatus = legalstatuses(:one)
  end

  test "should get index" do
    get legalstatuses_url
    assert_response :success
  end

  test "should get new" do
    get new_legalstatus_url
    assert_response :success
  end

  test "should create legalstatus" do
    assert_difference('Legalstatus.count') do
      post legalstatuses_url, params: { legalstatus: { code: @legalstatus.code, text: @legalstatus.text } }
    end

    assert_redirected_to legalstatus_url(Legalstatus.last)
  end

  test "should show legalstatus" do
    get legalstatus_url(@legalstatus)
    assert_response :success
  end

  test "should get edit" do
    get edit_legalstatus_url(@legalstatus)
    assert_response :success
  end

  test "should update legalstatus" do
    patch legalstatus_url(@legalstatus), params: { legalstatus: { code: @legalstatus.code, text: @legalstatus.text } }
    assert_redirected_to legalstatus_url(@legalstatus)
  end

  test "should destroy legalstatus" do
    assert_difference('Legalstatus.count', -1) do
      delete legalstatus_url(@legalstatus)
    end

    assert_redirected_to legalstatuses_url
  end
end
