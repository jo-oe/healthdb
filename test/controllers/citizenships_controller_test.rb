require 'test_helper'

class CitizenshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citizenship = citizenships(:one)
  end

  test "should get index" do
    get citizenships_url
    assert_response :success
  end

  test "should get new" do
    get new_citizenship_url
    assert_response :success
  end

  test "should create citizenship" do
    assert_difference('Citizenship.count') do
      post citizenships_url, params: { citizenship: { iso3166: @citizenship.iso3166, name: @citizenship.name } }
    end

    assert_redirected_to citizenship_url(Citizenship.last)
  end

  test "should show citizenship" do
    get citizenship_url(@citizenship)
    assert_response :success
  end

  test "should get edit" do
    get edit_citizenship_url(@citizenship)
    assert_response :success
  end

  test "should update citizenship" do
    patch citizenship_url(@citizenship), params: { citizenship: { iso3166: @citizenship.iso3166, name: @citizenship.name } }
    assert_redirected_to citizenship_url(@citizenship)
  end

  test "should destroy citizenship" do
    assert_difference('Citizenship.count', -1) do
      delete citizenship_url(@citizenship)
    end

    assert_redirected_to citizenships_url
  end
end
