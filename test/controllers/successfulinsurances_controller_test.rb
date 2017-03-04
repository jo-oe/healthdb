require 'test_helper'

class SuccessfulinsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @successfulinsurance = successfulinsurances(:one)
  end

  test "should get index" do
    get successfulinsurances_url
    assert_response :success
  end

  test "should get new" do
    get new_successfulinsurance_url
    assert_response :success
  end

  test "should create successfulinsurance" do
    assert_difference('Successfulinsurance.count') do
      post successfulinsurances_url, params: { successfulinsurance: { code: @successfulinsurance.code, text: @successfulinsurance.text } }
    end

    assert_redirected_to successfulinsurance_url(Successfulinsurance.last)
  end

  test "should show successfulinsurance" do
    get successfulinsurance_url(@successfulinsurance)
    assert_response :success
  end

  test "should get edit" do
    get edit_successfulinsurance_url(@successfulinsurance)
    assert_response :success
  end

  test "should update successfulinsurance" do
    patch successfulinsurance_url(@successfulinsurance), params: { successfulinsurance: { code: @successfulinsurance.code, text: @successfulinsurance.text } }
    assert_redirected_to successfulinsurance_url(@successfulinsurance)
  end

  test "should destroy successfulinsurance" do
    assert_difference('Successfulinsurance.count', -1) do
      delete successfulinsurance_url(@successfulinsurance)
    end

    assert_redirected_to successfulinsurances_url
  end
end
