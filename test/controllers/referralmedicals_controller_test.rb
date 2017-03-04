require 'test_helper'

class ReferralmedicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referralmedical = referralmedicals(:one)
  end

  test "should get index" do
    get referralmedicals_url
    assert_response :success
  end

  test "should get new" do
    get new_referralmedical_url
    assert_response :success
  end

  test "should create referralmedical" do
    assert_difference('Referralmedical.count') do
      post referralmedicals_url, params: { referralmedical: { code: @referralmedical.code, text: @referralmedical.text } }
    end

    assert_redirected_to referralmedical_url(Referralmedical.last)
  end

  test "should show referralmedical" do
    get referralmedical_url(@referralmedical)
    assert_response :success
  end

  test "should get edit" do
    get edit_referralmedical_url(@referralmedical)
    assert_response :success
  end

  test "should update referralmedical" do
    patch referralmedical_url(@referralmedical), params: { referralmedical: { code: @referralmedical.code, text: @referralmedical.text } }
    assert_redirected_to referralmedical_url(@referralmedical)
  end

  test "should destroy referralmedical" do
    assert_difference('Referralmedical.count', -1) do
      delete referralmedical_url(@referralmedical)
    end

    assert_redirected_to referralmedicals_url
  end
end
