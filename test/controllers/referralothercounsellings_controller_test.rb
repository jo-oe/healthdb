require 'test_helper'

class ReferralothercounsellingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referralothercounselling = referralothercounsellings(:one)
  end

  test "should get index" do
    get referralothercounsellings_url
    assert_response :success
  end

  test "should get new" do
    get new_referralothercounselling_url
    assert_response :success
  end

  test "should create referralothercounselling" do
    assert_difference('Referralothercounselling.count') do
      post referralothercounsellings_url, params: { referralothercounselling: { code: @referralothercounselling.code, text: @referralothercounselling.text } }
    end

    assert_redirected_to referralothercounselling_url(Referralothercounselling.last)
  end

  test "should show referralothercounselling" do
    get referralothercounselling_url(@referralothercounselling)
    assert_response :success
  end

  test "should get edit" do
    get edit_referralothercounselling_url(@referralothercounselling)
    assert_response :success
  end

  test "should update referralothercounselling" do
    patch referralothercounselling_url(@referralothercounselling), params: { referralothercounselling: { code: @referralothercounselling.code, text: @referralothercounselling.text } }
    assert_redirected_to referralothercounselling_url(@referralothercounselling)
  end

  test "should destroy referralothercounselling" do
    assert_difference('Referralothercounselling.count', -1) do
      delete referralothercounselling_url(@referralothercounselling)
    end

    assert_redirected_to referralothercounsellings_url
  end
end
