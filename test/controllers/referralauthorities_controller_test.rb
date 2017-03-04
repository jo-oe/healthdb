require 'test_helper'

class ReferralauthoritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referralauthority = referralauthorities(:one)
  end

  test "should get index" do
    get referralauthorities_url
    assert_response :success
  end

  test "should get new" do
    get new_referralauthority_url
    assert_response :success
  end

  test "should create referralauthority" do
    assert_difference('Referralauthority.count') do
      post referralauthorities_url, params: { referralauthority: { code: @referralauthority.code, text: @referralauthority.text } }
    end

    assert_redirected_to referralauthority_url(Referralauthority.last)
  end

  test "should show referralauthority" do
    get referralauthority_url(@referralauthority)
    assert_response :success
  end

  test "should get edit" do
    get edit_referralauthority_url(@referralauthority)
    assert_response :success
  end

  test "should update referralauthority" do
    patch referralauthority_url(@referralauthority), params: { referralauthority: { code: @referralauthority.code, text: @referralauthority.text } }
    assert_redirected_to referralauthority_url(@referralauthority)
  end

  test "should destroy referralauthority" do
    assert_difference('Referralauthority.count', -1) do
      delete referralauthority_url(@referralauthority)
    end

    assert_redirected_to referralauthorities_url
  end
end
