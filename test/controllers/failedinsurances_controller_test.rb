require 'test_helper'

class FailedinsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @failedinsurance = failedinsurances(:one)
  end

  test "should get index" do
    get failedinsurances_url
    assert_response :success
  end

  test "should get new" do
    get new_failedinsurance_url
    assert_response :success
  end

  test "should create failedinsurance" do
    assert_difference('Failedinsurance.count') do
      post failedinsurances_url, params: { failedinsurance: { code: @failedinsurance.code, text: @failedinsurance.text } }
    end

    assert_redirected_to failedinsurance_url(Failedinsurance.last)
  end

  test "should show failedinsurance" do
    get failedinsurance_url(@failedinsurance)
    assert_response :success
  end

  test "should get edit" do
    get edit_failedinsurance_url(@failedinsurance)
    assert_response :success
  end

  test "should update failedinsurance" do
    patch failedinsurance_url(@failedinsurance), params: { failedinsurance: { code: @failedinsurance.code, text: @failedinsurance.text } }
    assert_redirected_to failedinsurance_url(@failedinsurance)
  end

  test "should destroy failedinsurance" do
    assert_difference('Failedinsurance.count', -1) do
      delete failedinsurance_url(@failedinsurance)
    end

    assert_redirected_to failedinsurances_url
  end
end
