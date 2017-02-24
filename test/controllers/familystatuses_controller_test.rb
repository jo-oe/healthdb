require 'test_helper'

class FamilystatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @familystatus = familystatuses(:one)
  end

  test "should get index" do
    get familystatuses_url
    assert_response :success
  end

  test "should get new" do
    get new_familystatus_url
    assert_response :success
  end

  test "should create familystatus" do
    assert_difference('Familystatus.count') do
      post familystatuses_url, params: { familystatus: { code: @familystatus.code, text: @familystatus.text } }
    end

    assert_redirected_to familystatus_url(Familystatus.last)
  end

  test "should show familystatus" do
    get familystatus_url(@familystatus)
    assert_response :success
  end

  test "should get edit" do
    get edit_familystatus_url(@familystatus)
    assert_response :success
  end

  test "should update familystatus" do
    patch familystatus_url(@familystatus), params: { familystatus: { code: @familystatus.code, text: @familystatus.text } }
    assert_redirected_to familystatus_url(@familystatus)
  end

  test "should destroy familystatus" do
    assert_difference('Familystatus.count', -1) do
      delete familystatus_url(@familystatus)
    end

    assert_redirected_to familystatuses_url
  end
end
