require 'test_helper'

class CounselledpersonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counselledperson = counselledpersons(:one)
  end

  test "should get index" do
    get counselledpersons_index_url
    assert_response :success
  end

  test "should get new" do
    get new_counselledperson_url
    assert_response :success
  end

  test "should create counselledperson" do
    assert_difference('Counselledpersons.count') do
      post counselledpersons_index_url, params: { counselledperson: { code: @counselledperson.code, text: @counselledperson.text } }
    end

    assert_redirected_to counselledperson_url(Counselledpersons.last)
  end

  test "should show counselledperson" do
    get counselledperson_url(@counselledperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_counselledperson_url(@counselledperson)
    assert_response :success
  end

  test "should update counselledperson" do
    patch counselledperson_url(@counselledperson), params: { counselledperson: { code: @counselledperson.code, text: @counselledperson.text } }
    assert_redirected_to counselledperson_url(@counselledperson)
  end

  test "should destroy counselledperson" do
    assert_difference('Counselledpersons.count', -1) do
      delete counselledperson_url(@counselledperson)
    end

    assert_redirected_to counselledpersons_index_url
  end
end
