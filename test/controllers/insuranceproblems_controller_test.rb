require 'test_helper'

class InsuranceproblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insuranceproblem = insuranceproblems(:one)
  end

  test "should get index" do
    get insuranceproblems_url
    assert_response :success
  end

  test "should get new" do
    get new_insuranceproblem_url
    assert_response :success
  end

  test "should create insuranceproblem" do
    assert_difference('Insuranceproblem.count') do
      post insuranceproblems_url, params: { insuranceproblem: { code: @insuranceproblem.code, text: @insuranceproblem.text } }
    end

    assert_redirected_to insuranceproblem_url(Insuranceproblem.last)
  end

  test "should show insuranceproblem" do
    get insuranceproblem_url(@insuranceproblem)
    assert_response :success
  end

  test "should get edit" do
    get edit_insuranceproblem_url(@insuranceproblem)
    assert_response :success
  end

  test "should update insuranceproblem" do
    patch insuranceproblem_url(@insuranceproblem), params: { insuranceproblem: { code: @insuranceproblem.code, text: @insuranceproblem.text } }
    assert_redirected_to insuranceproblem_url(@insuranceproblem)
  end

  test "should destroy insuranceproblem" do
    assert_difference('Insuranceproblem.count', -1) do
      delete insuranceproblem_url(@insuranceproblem)
    end

    assert_redirected_to insuranceproblems_url
  end
end
