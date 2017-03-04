require 'test_helper'

class HealthproblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @healthproblem = healthproblems(:one)
  end

  test "should get index" do
    get healthproblems_url
    assert_response :success
  end

  test "should get new" do
    get new_healthproblem_url
    assert_response :success
  end

  test "should create healthproblem" do
    assert_difference('Healthproblem.count') do
      post healthproblems_url, params: { healthproblem: { code: @healthproblem.code, text: @healthproblem.text } }
    end

    assert_redirected_to healthproblem_url(Healthproblem.last)
  end

  test "should show healthproblem" do
    get healthproblem_url(@healthproblem)
    assert_response :success
  end

  test "should get edit" do
    get edit_healthproblem_url(@healthproblem)
    assert_response :success
  end

  test "should update healthproblem" do
    patch healthproblem_url(@healthproblem), params: { healthproblem: { code: @healthproblem.code, text: @healthproblem.text } }
    assert_redirected_to healthproblem_url(@healthproblem)
  end

  test "should destroy healthproblem" do
    assert_difference('Healthproblem.count', -1) do
      delete healthproblem_url(@healthproblem)
    end

    assert_redirected_to healthproblems_url
  end
end
