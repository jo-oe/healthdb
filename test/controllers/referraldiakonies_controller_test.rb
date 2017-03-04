require 'test_helper'

class ReferraldiakoniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referraldiakony = referraldiakonies(:one)
  end

  test "should get index" do
    get referraldiakonies_url
    assert_response :success
  end

  test "should get new" do
    get new_referraldiakony_url
    assert_response :success
  end

  test "should create referraldiakony" do
    assert_difference('Referraldiakonie.count') do
      post referraldiakonies_url, params: { referraldiakony: { code: @referraldiakony.code, text: @referraldiakony.text } }
    end

    assert_redirected_to referraldiakony_url(Referraldiakonie.last)
  end

  test "should show referraldiakony" do
    get referraldiakony_url(@referraldiakony)
    assert_response :success
  end

  test "should get edit" do
    get edit_referraldiakony_url(@referraldiakony)
    assert_response :success
  end

  test "should update referraldiakony" do
    patch referraldiakony_url(@referraldiakony), params: { referraldiakony: { code: @referraldiakony.code, text: @referraldiakony.text } }
    assert_redirected_to referraldiakony_url(@referraldiakony)
  end

  test "should destroy referraldiakony" do
    assert_difference('Referraldiakonie.count', -1) do
      delete referraldiakony_url(@referraldiakony)
    end

    assert_redirected_to referraldiakonies_url
  end
end
