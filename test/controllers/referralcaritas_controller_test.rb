require 'test_helper'

class ReferralcaritasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referralcarita = referralcaritas(:one)
  end

  test "should get index" do
    get referralcaritas_index_url
    assert_response :success
  end

  test "should get new" do
    get new_referralcarita_url
    assert_response :success
  end

  test "should create referralcarita" do
    assert_difference('Referralcaritas.count') do
      post referralcaritas_index_url, params: { referralcarita: { code: @referralcarita.code, text: @referralcarita.text } }
    end

    assert_redirected_to referralcarita_url(Referralcaritas.last)
  end

  test "should show referralcarita" do
    get referralcarita_url(@referralcarita)
    assert_response :success
  end

  test "should get edit" do
    get edit_referralcarita_url(@referralcarita)
    assert_response :success
  end

  test "should update referralcarita" do
    patch referralcarita_url(@referralcarita), params: { referralcarita: { code: @referralcarita.code, text: @referralcarita.text } }
    assert_redirected_to referralcarita_url(@referralcarita)
  end

  test "should destroy referralcarita" do
    assert_difference('Referralcaritas.count', -1) do
      delete referralcarita_url(@referralcarita)
    end

    assert_redirected_to referralcaritas_index_url
  end
end
